; DESCRIPTION: Renders a purple line between points (332, 253) and (376, 170).
; PLAN: r0=332(x1), r1=253(y1), r2=376(x2), r3=170(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 253
LDI r2, 376
LDI r3, 170
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
