; DESCRIPTION: Places a yellow line segment connecting (320, 62) to (364, 162).
; PLAN: r0=320(x1), r1=62(y1), r2=364(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 62
LDI r2, 364
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
