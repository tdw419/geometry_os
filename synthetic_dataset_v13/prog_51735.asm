; DESCRIPTION: Places a yellow line segment connecting (3, 248) to (351, 153).
; PLAN: r0=3(x1), r1=248(y1), r2=351(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 248
LDI r2, 351
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
