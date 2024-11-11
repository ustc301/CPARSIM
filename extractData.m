clear all
clc
filename='zyzhangResearch.txt';
fid=fopen(filename,'r');
if(fid == -1)
    error('Fail to open the data file.');
end
% datum=textread(filename,'%s','whitespace','\n');
% n=length(datum);
n=8100087;
%  id,                                  1:tabLoc(1)-1
%  openState,                     tabLoc(1)+1:tabLoc(2)-1
%  record1,                         tabLoc(2)+1:tabLoc(3)-1
%  record2,                         tabLoc(3)+1:tabLoc(4)-1
%  record3,                         tabLoc(4)+1:tabLoc(5)-1
%  frequent,                        tabLoc(5)+1:tabLoc(6)-1
%  leakage_current,            tabLoc(6)+1:tabLoc(7)-1
%  N_temp,                         tabLoc(7)+1:tabLoc(8)-1
%  A_temp,                         tabLoc(8)+1:tabLoc(9)-1
%  A_voltage,                      tabLoc(9)+1:tabLoc(10)-1
%  A_current,                      tabLoc(10)+1:tabLoc(11)-1
%  A_Pf,                               tabLoc(11)+1:tabLoc(12)-1
%  A_power,                        tabLoc(12)+1:tabLoc(13)-1
%  A_Q,                               tabLoc(13)+1:tabLoc(14)-1
%  A_S,                                tabLoc(14)+1:tabLoc(15)-1
%  A_H,                               tabLoc(15)+1:tabLoc(16)-1
%  A_L,                                tabLoc(16)+1:tabLoc(17)-1
%  B_temp,                         tabLoc(17)+1:tabLoc(18)-1
%  B_voltage,                     tabLoc(18)+1:tabLoc(19)-1
%  B_current,                     tabLoc(19)+1:tabLoc(20)-1
%  B_Pf,                             tabLoc(20)+1:tabLoc(21)-1
%  B_power,                      tabLoc(21)+1:tabLoc(22)-1
%  B_Q,                             tabLoc(22)+1:tabLoc(23)-1
%  B_S,                              tabLoc(23)+1:tabLoc(24)-1
%  B_H,                              tabLoc(24)+1:tabLoc(25)-1
%  B_L,                               tabLoc(25)+1:tabLoc(26)-1
%  C_temp,                        tabLoc(26)+1:tabLoc(27)-1
%  C_voltage,                    tabLoc(27)+1:tabLoc(28)-1
%  C_current,                    tabLoc(28)+1:tabLoc(29)-1
%  C_Pf,                             tabLoc(29)+1:tabLoc(30)-1
%  C_power,                      tabLoc(30)+1:tabLoc(31)-1
%  C_Q,                             tabLoc(31)+1:tabLoc(32)-1
%  C_S,                              tabLoc(32)+1:tabLoc(33)-1
%  C_H,                             tabLoc(33)+1:tabLoc(34)-1
%  C_L,                              tabLoc(34)+1:tabLoc(35)-1
%  power,                         tabLoc(35)+1:tabLoc(36)-1
%  Q,                                tabLoc(36)+1:tabLoc(37)-1
%  S,                                 tabLoc(37)+1:tabLoc(38)-1
%  H,                                tabLoc(38)+1:tabLoc(39)-1
%  L,                                 tabLoc(39)+1:tabLoc(40)-1
%  collectTime,                tabLoc(40)+1:tabLoc(41)-1
%  saveTime,                    tabLoc(41)+1:end
frameData=zeros(27,n);
frameTime=strings(2,n);
i=0;
while ~feof(fid)
    i=i+1;
%for i=1:1:n
    %s=datum{i};
    s=fgetl(fid);
    tabLoc=strfind(s,char(9));
    %  id,                                  1:tabLoc(1)-1
    %  openState,                     tabLoc(1)+1:tabLoc(2)-1
    %  record1,                         tabLoc(2)+1:tabLoc(3)-1
    %  record2,                         tabLoc(3)+1:tabLoc(4)-1
    %  record3,                         tabLoc(4)+1:tabLoc(5)-1
    %  frequent,                        tabLoc(5)+1:tabLoc(6)-1
    %  leakage_current,            tabLoc(6)+1:tabLoc(7)-1
    frameData(1,i) =str2double(s(tabLoc(6)+1:tabLoc(7)-1));
    %  N_temp,                         tabLoc(7)+1:tabLoc(8)-1
    frameData(2,i) =str2double(s(tabLoc(7)+1:tabLoc(8)-1));
    %  A_temp,                         tabLoc(8)+1:tabLoc(9)-1
    %  A_voltage,                      tabLoc(9)+1:tabLoc(10)-1
    frameData(3,i) =str2double(s(tabLoc(9)+1:tabLoc(10)-1));
    %  A_current,                      tabLoc(10)+1:tabLoc(11)-1
    frameData(4,i) =str2double(s(tabLoc(10)+1:tabLoc(11)-1));
    %  A_Pf,                               tabLoc(11)+1:tabLoc(12)-1
    frameData(5,i) =str2double(s(tabLoc(11)+1:tabLoc(12)-1));
    %  A_power,                        tabLoc(12)+1:tabLoc(13)-1
    frameData(6,i) =str2double(s(tabLoc(12)+1:tabLoc(13)-1));
    %  A_Q,                               tabLoc(13)+1:tabLoc(14)-1
    frameData(7,i) =str2double(s(tabLoc(13)+1:tabLoc(14)-1));
    %  A_S,                                tabLoc(14)+1:tabLoc(15)-1
    frameData(8,i) =str2double(s(tabLoc(14)+1:tabLoc(15)-1)); 
    %  A_H,                               tabLoc(15)+1:tabLoc(16)-1
    %  A_L,                                tabLoc(16)+1:tabLoc(17)-1    
    tmp=str2double(s(tabLoc(15)+1:tabLoc(16)-1))*65536/1000;
    tmp=tmp+str2double(s(tabLoc(16)+1:tabLoc(17)-1));
    frameData(9,i) =tmp;
    %  B_temp,                         tabLoc(17)+1:tabLoc(18)-1
    %  B_voltage,                     tabLoc(18)+1:tabLoc(19)-1
    frameData(10,i) =str2double(s(tabLoc(18)+1:tabLoc(19)-1));
    %  B_current,                     tabLoc(19)+1:tabLoc(20)-1
    frameData(11,i) =str2double(s(tabLoc(19)+1:tabLoc(20)-1));
    %  B_Pf,                             tabLoc(20)+1:tabLoc(21)-1
    frameData(12,i) =str2double(s(tabLoc(20)+1:tabLoc(21)-1));
    %  B_power,                      tabLoc(21)+1:tabLoc(22)-1
    frameData(13,i) =str2double(s(tabLoc(21)+1:tabLoc(22)-1));
    %  B_Q,                             tabLoc(22)+1:tabLoc(23)-1
    frameData(14,i) =str2double(s(tabLoc(22)+1:tabLoc(23)-1));
    %  B_S,                              tabLoc(23)+1:tabLoc(24)-1
    frameData(15,i) =str2double(s(tabLoc(23)+1:tabLoc(24)-1));  
    %  B_H,                              tabLoc(24)+1:tabLoc(25)-1
    %  B_L,                               tabLoc(25)+1:tabLoc(26)-1
    tmp=str2double(s(tabLoc(24)+1:tabLoc(25)-1))*65536/1000;
    tmp=tmp+str2double(s(tabLoc(25)+1:tabLoc(26)-1));
    frameData(16,i) =tmp;
    %  C_temp,                        tabLoc(26)+1:tabLoc(27)-1
    %  C_voltage,                    tabLoc(27)+1:tabLoc(28)-1
    frameData(17,i) =str2double(s(tabLoc(27)+1:tabLoc(28)-1));
    %  C_current,                    tabLoc(28)+1:tabLoc(29)-1
    frameData(18,i) =str2double(s(tabLoc(28)+1:tabLoc(29)-1));
    %  C_Pf,                             tabLoc(29)+1:tabLoc(30)-1
    frameData(19,i) =str2double(s(tabLoc(29)+1:tabLoc(30)-1));
    %  C_power,                      tabLoc(30)+1:tabLoc(31)-1
    frameData(20,i) =str2double(s(tabLoc(30)+1:tabLoc(31)-1));
    %  C_Q,                             tabLoc(31)+1:tabLoc(32)-1
    frameData(21,i) =str2double(s(tabLoc(31)+1:tabLoc(32)-1));
    %  C_S,                              tabLoc(32)+1:tabLoc(33)-1
    frameData(22,i) =str2double(s(tabLoc(32)+1:tabLoc(33)-1));
    %  C_H,                             tabLoc(33)+1:tabLoc(34)-1
    %  C_L,                              tabLoc(34)+1:tabLoc(35)-1
    tmp=str2double(s(tabLoc(33)+1:tabLoc(34)-1))*65536/1000;
    tmp=tmp+str2double(s(tabLoc(34)+1:tabLoc(35)-1));
    frameData(23,i) =tmp;  
    %  power,                         tabLoc(35)+1:tabLoc(36)-1
    frameData(24,i) =str2double(s(tabLoc(35)+1:tabLoc(36)-1));
    %  Q,                                tabLoc(36)+1:tabLoc(37)-1
    frameData(25,i) =str2double(s(tabLoc(36)+1:tabLoc(37)-1));
    %  S,                                 tabLoc(37)+1:tabLoc(38)-1
    frameData(26,i) =str2double(s(tabLoc(37)+1:tabLoc(38)-1));
    %  H,                                tabLoc(38)+1:tabLoc(39)-1
    %  L,                                 tabLoc(39)+1:tabLoc(40)-1
    tmp=str2double(s(tabLoc(38)+1:tabLoc(39)-1))*65536/1000;
    tmp=tmp+str2double(s(tabLoc(39)+1:tabLoc(40)-1));
    frameData(27,i) =tmp;  
    %  collectTime,                tabLoc(40)+1:tabLoc(41)-1
    frameTime(1,i)=string(s(tabLoc(40)+1:tabLoc(41)-1));
    %  saveTime,                    tabLoc(41)+1:end
    frameTime(2,i)=string(s(tabLoc(41)+1:end));
    if mod(i,10000)==0
        i
    end
end
fclose(fid);
save('fullDataFrame','frameData','frameTime');