; DESCRIPTION: Draws a blue line from (488, 44) to (430, 121).
; PLAN: r0=488(x1), r1=44(y1), r2=430(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 44
LDI r2, 430
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
