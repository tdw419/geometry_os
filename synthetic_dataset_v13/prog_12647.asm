; DESCRIPTION: Places a yellow line segment connecting (259, 248) to (76, 7).
; PLAN: r0=259(x1), r1=248(y1), r2=76(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 248
LDI r2, 76
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
