; DESCRIPTION: Places a purple line segment connecting (128, 35) to (214, 203).
; PLAN: r0=128(x1), r1=35(y1), r2=214(x2), r3=203(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 35
LDI r2, 214
LDI r3, 203
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
