; DESCRIPTION: Places a white line segment connecting (233, 61) to (191, 109).
; PLAN: r0=233(x1), r1=61(y1), r2=191(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 61
LDI r2, 191
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
