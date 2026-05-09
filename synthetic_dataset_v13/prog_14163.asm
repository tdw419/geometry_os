; DESCRIPTION: Draws a blue line from (52, 158) to (335, 2).
; PLAN: r0=52(x1), r1=158(y1), r2=335(x2), r3=2(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 158
LDI r2, 335
LDI r3, 2
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
