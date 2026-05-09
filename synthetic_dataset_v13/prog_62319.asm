; DESCRIPTION: Places a yellow line segment connecting (499, 201) to (32, 227).
; PLAN: r0=499(x1), r1=201(y1), r2=32(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 499
LDI r1, 201
LDI r2, 32
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
