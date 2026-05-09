; DESCRIPTION: Draws a black line from (158, 190) to (381, 31).
; PLAN: r0=158(x1), r1=190(y1), r2=381(x2), r3=31(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 190
LDI r2, 381
LDI r3, 31
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
