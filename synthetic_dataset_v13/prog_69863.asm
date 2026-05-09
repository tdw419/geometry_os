; DESCRIPTION: Places a red line segment connecting (11, 91) to (331, 130).
; PLAN: r0=11(x1), r1=91(y1), r2=331(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 91
LDI r2, 331
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
