; DESCRIPTION: Places a white line segment connecting (280, 156) to (430, 79).
; PLAN: r0=280(x1), r1=156(y1), r2=430(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 156
LDI r2, 430
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
