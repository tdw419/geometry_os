; DESCRIPTION: Places a purple line segment connecting (128, 234) to (165, 83).
; PLAN: r0=128(x1), r1=234(y1), r2=165(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 234
LDI r2, 165
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
