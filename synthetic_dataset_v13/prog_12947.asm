; DESCRIPTION: Draws a purple line from (257, 78) to (158, 30).
; PLAN: r0=257(x1), r1=78(y1), r2=158(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 78
LDI r2, 158
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
