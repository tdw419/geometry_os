; DESCRIPTION: Draws a purple line from (454, 21) to (247, 170).
; PLAN: r0=454(x1), r1=21(y1), r2=247(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 21
LDI r2, 247
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
