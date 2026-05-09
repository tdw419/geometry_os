; DESCRIPTION: Places a yellow line segment connecting (351, 62) to (382, 135).
; PLAN: r0=351(x1), r1=62(y1), r2=382(x2), r3=135(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 62
LDI r2, 382
LDI r3, 135
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
