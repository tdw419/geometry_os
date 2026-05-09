; DESCRIPTION: Places a white line segment connecting (34, 155) to (462, 82).
; PLAN: r0=34(x1), r1=155(y1), r2=462(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 155
LDI r2, 462
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
