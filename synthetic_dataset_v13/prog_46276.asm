; DESCRIPTION: Places a yellow line segment connecting (400, 18) to (188, 43).
; PLAN: r0=400(x1), r1=18(y1), r2=188(x2), r3=43(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 18
LDI r2, 188
LDI r3, 43
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
