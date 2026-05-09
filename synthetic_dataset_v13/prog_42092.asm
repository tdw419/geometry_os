; DESCRIPTION: Places a white line segment connecting (462, 105) to (83, 24).
; PLAN: r0=462(x1), r1=105(y1), r2=83(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 105
LDI r2, 83
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
