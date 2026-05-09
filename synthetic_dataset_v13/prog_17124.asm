; DESCRIPTION: Places a white line segment connecting (28, 109) to (34, 110).
; PLAN: r0=28(x1), r1=109(y1), r2=34(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 109
LDI r2, 34
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
