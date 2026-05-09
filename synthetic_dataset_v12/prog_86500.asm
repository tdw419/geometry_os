; DESCRIPTION: Places a white line segment connecting (163, 234) to (169, 79).
; PLAN: r0=163(x1), r1=234(y1), r2=169(x2), r3=79(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 234
LDI r2, 169
LDI r3, 79
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
