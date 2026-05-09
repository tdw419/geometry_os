; DESCRIPTION: Places a yellow line segment connecting (340, 85) to (204, 22).
; PLAN: r0=340(x1), r1=85(y1), r2=204(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 85
LDI r2, 204
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
