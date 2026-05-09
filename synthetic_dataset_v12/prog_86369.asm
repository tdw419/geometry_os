; DESCRIPTION: Places a white line segment connecting (169, 114) to (395, 37).
; PLAN: r0=169(x1), r1=114(y1), r2=395(x2), r3=37(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 114
LDI r2, 395
LDI r3, 37
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
