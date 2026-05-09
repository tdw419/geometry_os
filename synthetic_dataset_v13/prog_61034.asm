; DESCRIPTION: Places a purple line segment connecting (453, 113) to (321, 224).
; PLAN: r0=453(x1), r1=113(y1), r2=321(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 113
LDI r2, 321
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
