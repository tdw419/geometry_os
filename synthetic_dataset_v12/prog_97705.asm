; DESCRIPTION: Places a white line segment connecting (85, 29) to (266, 60).
; PLAN: r0=85(x1), r1=29(y1), r2=266(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 29
LDI r2, 266
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
