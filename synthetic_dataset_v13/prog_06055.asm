; DESCRIPTION: Places a purple line segment connecting (253, 85) to (402, 248).
; PLAN: r0=253(x1), r1=85(y1), r2=402(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 85
LDI r2, 402
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
