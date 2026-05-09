; DESCRIPTION: Places a white line segment connecting (55, 204) to (318, 76).
; PLAN: r0=55(x1), r1=204(y1), r2=318(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 204
LDI r2, 318
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
