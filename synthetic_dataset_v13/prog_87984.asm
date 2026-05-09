; DESCRIPTION: Draws a blue line from (13, 94) to (306, 1).
; PLAN: r0=13(x1), r1=94(y1), r2=306(x2), r3=1(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 94
LDI r2, 306
LDI r3, 1
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
