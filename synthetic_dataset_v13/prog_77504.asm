; DESCRIPTION: Places a white line segment connecting (388, 212) to (78, 46).
; PLAN: r0=388(x1), r1=212(y1), r2=78(x2), r3=46(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 212
LDI r2, 78
LDI r3, 46
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
