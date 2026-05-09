; DESCRIPTION: Places a purple line segment connecting (273, 130) to (232, 192).
; PLAN: r0=273(x1), r1=130(y1), r2=232(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 130
LDI r2, 232
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
