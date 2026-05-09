; DESCRIPTION: Places a yellow line segment connecting (134, 80) to (500, 13).
; PLAN: r0=134(x1), r1=80(y1), r2=500(x2), r3=13(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 80
LDI r2, 500
LDI r3, 13
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
