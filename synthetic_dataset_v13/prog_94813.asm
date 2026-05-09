; DESCRIPTION: Places a yellow line segment connecting (105, 97) to (500, 227).
; PLAN: r0=105(x1), r1=97(y1), r2=500(x2), r3=227(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 97
LDI r2, 500
LDI r3, 227
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
