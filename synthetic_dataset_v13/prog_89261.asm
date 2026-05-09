; DESCRIPTION: Places a white line segment connecting (102, 78) to (188, 21).
; PLAN: r0=102(x1), r1=78(y1), r2=188(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 78
LDI r2, 188
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
