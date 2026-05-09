; DESCRIPTION: Draws a purple line from (498, 145) to (458, 192).
; PLAN: r0=498(x1), r1=145(y1), r2=458(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 145
LDI r2, 458
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
