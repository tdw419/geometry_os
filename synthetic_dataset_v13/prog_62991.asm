; DESCRIPTION: Places a red line segment connecting (457, 196) to (287, 109).
; PLAN: r0=457(x1), r1=196(y1), r2=287(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 196
LDI r2, 287
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
