; DESCRIPTION: Places a purple line segment connecting (21, 58) to (376, 253).
; PLAN: r0=21(x1), r1=58(y1), r2=376(x2), r3=253(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 58
LDI r2, 376
LDI r3, 253
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
