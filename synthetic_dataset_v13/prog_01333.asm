; DESCRIPTION: Places a yellow line segment connecting (422, 9) to (472, 101).
; PLAN: r0=422(x1), r1=9(y1), r2=472(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 9
LDI r2, 472
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
