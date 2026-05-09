; DESCRIPTION: Places a white line segment connecting (462, 163) to (314, 70).
; PLAN: r0=462(x1), r1=163(y1), r2=314(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 163
LDI r2, 314
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
