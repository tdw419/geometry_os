; DESCRIPTION: Places a red line segment connecting (169, 232) to (338, 250).
; PLAN: r0=169(x1), r1=232(y1), r2=338(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 232
LDI r2, 338
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
