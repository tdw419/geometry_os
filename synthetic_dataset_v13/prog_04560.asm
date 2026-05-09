; DESCRIPTION: Draws a purple line from (343, 85) to (265, 129).
; PLAN: r0=343(x1), r1=85(y1), r2=265(x2), r3=129(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 85
LDI r2, 265
LDI r3, 129
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
