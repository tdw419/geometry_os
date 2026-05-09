; DESCRIPTION: Places a yellow line segment connecting (422, 109) to (395, 43).
; PLAN: r0=422(x1), r1=109(y1), r2=395(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 109
LDI r2, 395
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
