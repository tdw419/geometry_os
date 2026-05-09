; DESCRIPTION: Draws a blue line from (53, 175) to (306, 119).
; PLAN: r0=53(x1), r1=175(y1), r2=306(x2), r3=119(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 175
LDI r2, 306
LDI r3, 119
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
