; DESCRIPTION: Places a yellow line segment connecting (351, 128) to (77, 35).
; PLAN: r0=351(x1), r1=128(y1), r2=77(x2), r3=35(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 128
LDI r2, 77
LDI r3, 35
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
