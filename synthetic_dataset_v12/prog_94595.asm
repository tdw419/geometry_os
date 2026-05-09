; DESCRIPTION: Places a white line segment connecting (169, 79) to (114, 36).
; PLAN: r0=169(x1), r1=79(y1), r2=114(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 79
LDI r2, 114
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
