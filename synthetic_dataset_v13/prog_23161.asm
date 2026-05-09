; DESCRIPTION: Places a white line segment connecting (309, 22) to (364, 130).
; PLAN: r0=309(x1), r1=22(y1), r2=364(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 22
LDI r2, 364
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
