; DESCRIPTION: Places a yellow line segment connecting (399, 137) to (344, 128).
; PLAN: r0=399(x1), r1=137(y1), r2=344(x2), r3=128(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 137
LDI r2, 344
LDI r3, 128
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
