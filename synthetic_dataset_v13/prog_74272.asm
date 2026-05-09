; DESCRIPTION: Places a white line segment connecting (475, 40) to (357, 234).
; PLAN: r0=475(x1), r1=40(y1), r2=357(x2), r3=234(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 475
LDI r1, 40
LDI r2, 357
LDI r3, 234
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
