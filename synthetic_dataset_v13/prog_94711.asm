; DESCRIPTION: Places a purple line segment connecting (364, 12) to (217, 219).
; PLAN: r0=364(x1), r1=12(y1), r2=217(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 12
LDI r2, 217
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
