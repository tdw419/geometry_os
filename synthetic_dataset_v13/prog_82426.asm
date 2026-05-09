; DESCRIPTION: Places a white line segment connecting (357, 139) to (349, 69).
; PLAN: r0=357(x1), r1=139(y1), r2=349(x2), r3=69(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 139
LDI r2, 349
LDI r3, 69
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
