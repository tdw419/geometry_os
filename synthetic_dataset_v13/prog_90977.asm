; DESCRIPTION: Places a white line segment connecting (357, 0) to (114, 214).
; PLAN: r0=357(x1), r1=0(y1), r2=114(x2), r3=214(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 0
LDI r2, 114
LDI r3, 214
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
