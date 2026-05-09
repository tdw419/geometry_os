; DESCRIPTION: Places a white line segment connecting (0, 54) to (49, 129).
; PLAN: r0=0(x1), r1=54(y1), r2=49(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 54
LDI r2, 49
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
