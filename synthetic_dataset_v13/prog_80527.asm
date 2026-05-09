; DESCRIPTION: Draws a blue line from (31, 246) to (6, 70).
; PLAN: r0=31(x1), r1=246(y1), r2=6(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 246
LDI r2, 6
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
