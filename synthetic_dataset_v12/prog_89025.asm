; DESCRIPTION: Places a yellow line segment connecting (382, 184) to (506, 248).
; PLAN: r0=382(x1), r1=184(y1), r2=506(x2), r3=248(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 184
LDI r2, 506
LDI r3, 248
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
