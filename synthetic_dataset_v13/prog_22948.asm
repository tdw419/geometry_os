; DESCRIPTION: Places a white line segment connecting (205, 69) to (431, 71).
; PLAN: r0=205(x1), r1=69(y1), r2=431(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 69
LDI r2, 431
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
