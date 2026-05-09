; DESCRIPTION: Places a white line segment connecting (31, 91) to (250, 24).
; PLAN: r0=31(x1), r1=91(y1), r2=250(x2), r3=24(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 91
LDI r2, 250
LDI r3, 24
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
