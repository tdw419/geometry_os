; DESCRIPTION: Places a purple line segment connecting (459, 219) to (206, 248).
; PLAN: r0=459(x1), r1=219(y1), r2=206(x2), r3=248(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 219
LDI r2, 206
LDI r3, 248
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
