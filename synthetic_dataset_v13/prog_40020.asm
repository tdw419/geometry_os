; DESCRIPTION: Places a white line segment connecting (431, 7) to (357, 104).
; PLAN: r0=431(x1), r1=7(y1), r2=357(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 7
LDI r2, 357
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
