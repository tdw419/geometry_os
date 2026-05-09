; DESCRIPTION: Places a white line segment connecting (15, 20) to (160, 130).
; PLAN: r0=15(x1), r1=20(y1), r2=160(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 20
LDI r2, 160
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
