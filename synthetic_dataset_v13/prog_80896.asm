; DESCRIPTION: Places a white line segment connecting (88, 69) to (112, 191).
; PLAN: r0=88(x1), r1=69(y1), r2=112(x2), r3=191(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 69
LDI r2, 112
LDI r3, 191
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
