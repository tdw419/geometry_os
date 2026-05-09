; DESCRIPTION: Draws a blue line from (98, 54) to (22, 122).
; PLAN: r0=98(x1), r1=54(y1), r2=22(x2), r3=122(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 54
LDI r2, 22
LDI r3, 122
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
