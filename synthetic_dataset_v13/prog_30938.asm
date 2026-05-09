; DESCRIPTION: Places a white line segment connecting (109, 106) to (347, 22).
; PLAN: r0=109(x1), r1=106(y1), r2=347(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 106
LDI r2, 347
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
