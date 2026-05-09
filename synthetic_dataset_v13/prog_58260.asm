; DESCRIPTION: Draws a purple line from (28, 191) to (139, 211).
; PLAN: r0=28(x1), r1=191(y1), r2=139(x2), r3=211(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 191
LDI r2, 139
LDI r3, 211
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
