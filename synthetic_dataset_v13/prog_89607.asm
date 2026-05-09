; DESCRIPTION: Places a yellow line segment connecting (70, 83) to (78, 227).
; PLAN: r0=70(x1), r1=83(y1), r2=78(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 83
LDI r2, 78
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
