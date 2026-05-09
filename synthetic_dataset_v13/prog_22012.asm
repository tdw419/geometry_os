; DESCRIPTION: Draws a purple line from (354, 116) to (364, 202).
; PLAN: r0=354(x1), r1=116(y1), r2=364(x2), r3=202(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 116
LDI r2, 364
LDI r3, 202
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
