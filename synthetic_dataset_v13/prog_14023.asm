; DESCRIPTION: Draws a purple line from (414, 15) to (274, 59).
; PLAN: r0=414(x1), r1=15(y1), r2=274(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 15
LDI r2, 274
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
