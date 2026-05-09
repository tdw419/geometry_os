; DESCRIPTION: Places a white line segment connecting (155, 55) to (22, 11).
; PLAN: r0=155(x1), r1=55(y1), r2=22(x2), r3=11(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 55
LDI r2, 22
LDI r3, 11
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
