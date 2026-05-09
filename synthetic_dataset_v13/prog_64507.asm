; DESCRIPTION: Places a yellow line segment connecting (430, 192) to (440, 73).
; PLAN: r0=430(x1), r1=192(y1), r2=440(x2), r3=73(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 192
LDI r2, 440
LDI r3, 73
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
