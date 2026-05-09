; DESCRIPTION: Places a black line segment connecting (271, 248) to (459, 179).
; PLAN: r0=271(x1), r1=248(y1), r2=459(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 248
LDI r2, 459
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
