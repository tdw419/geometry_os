; DESCRIPTION: Places a yellow line segment connecting (422, 101) to (288, 71).
; PLAN: r0=422(x1), r1=101(y1), r2=288(x2), r3=71(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 101
LDI r2, 288
LDI r3, 71
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
