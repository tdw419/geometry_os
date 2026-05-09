; DESCRIPTION: Draws a blue line from (488, 141) to (91, 13).
; PLAN: r0=488(x1), r1=141(y1), r2=91(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 141
LDI r2, 91
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
