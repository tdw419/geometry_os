; DESCRIPTION: Draws a purple line from (321, 72) to (376, 0).
; PLAN: r0=321(x1), r1=72(y1), r2=376(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 72
LDI r2, 376
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
