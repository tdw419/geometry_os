; DESCRIPTION: Renders a white line between points (78, 31) and (496, 92).
; PLAN: r0=78(x1), r1=31(y1), r2=496(x2), r3=92(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 31
LDI r2, 496
LDI r3, 92
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
