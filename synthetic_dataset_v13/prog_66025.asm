; DESCRIPTION: Draws a purple line from (236, 218) to (354, 245).
; PLAN: r0=236(x1), r1=218(y1), r2=354(x2), r3=245(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 218
LDI r2, 354
LDI r3, 245
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
