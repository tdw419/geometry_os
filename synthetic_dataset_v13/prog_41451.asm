; DESCRIPTION: Places a white line segment connecting (258, 181) to (54, 136).
; PLAN: r0=258(x1), r1=181(y1), r2=54(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 181
LDI r2, 54
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
