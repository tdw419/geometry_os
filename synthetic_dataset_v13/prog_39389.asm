; DESCRIPTION: Places a purple line segment connecting (437, 219) to (173, 192).
; PLAN: r0=437(x1), r1=219(y1), r2=173(x2), r3=192(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 219
LDI r2, 173
LDI r3, 192
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
