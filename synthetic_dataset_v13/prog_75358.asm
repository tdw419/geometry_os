; DESCRIPTION: Places a white line segment connecting (343, 214) to (360, 245).
; PLAN: r0=343(x1), r1=214(y1), r2=360(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 214
LDI r2, 360
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
