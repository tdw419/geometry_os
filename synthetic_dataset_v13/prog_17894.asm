; DESCRIPTION: Places a white line segment connecting (232, 20) to (290, 227).
; PLAN: r0=232(x1), r1=20(y1), r2=290(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 20
LDI r2, 290
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
