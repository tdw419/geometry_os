; DESCRIPTION: Draws a purple line from (181, 33) to (257, 205).
; PLAN: r0=181(x1), r1=33(y1), r2=257(x2), r3=205(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 33
LDI r2, 257
LDI r3, 205
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
