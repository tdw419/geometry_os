; DESCRIPTION: Draws a purple line from (190, 97) to (343, 109).
; PLAN: r0=190(x1), r1=97(y1), r2=343(x2), r3=109(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 97
LDI r2, 343
LDI r3, 109
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
