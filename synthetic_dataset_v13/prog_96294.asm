; DESCRIPTION: Places a white line segment connecting (50, 120) to (457, 129).
; PLAN: r0=50(x1), r1=120(y1), r2=457(x2), r3=129(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 120
LDI r2, 457
LDI r3, 129
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
