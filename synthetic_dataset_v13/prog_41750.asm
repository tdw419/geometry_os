; DESCRIPTION: Places a white line segment connecting (107, 100) to (170, 130).
; PLAN: r0=107(x1), r1=100(y1), r2=170(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 100
LDI r2, 170
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
