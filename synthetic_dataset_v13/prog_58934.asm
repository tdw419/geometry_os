; DESCRIPTION: Places a yellow line segment connecting (129, 76) to (499, 144).
; PLAN: r0=129(x1), r1=76(y1), r2=499(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 76
LDI r2, 499
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
