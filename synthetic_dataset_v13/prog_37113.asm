; DESCRIPTION: Places a yellow line segment connecting (129, 222) to (340, 212).
; PLAN: r0=129(x1), r1=222(y1), r2=340(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 222
LDI r2, 340
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
