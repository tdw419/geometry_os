; DESCRIPTION: Places a white line segment connecting (418, 115) to (339, 130).
; PLAN: r0=418(x1), r1=115(y1), r2=339(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 115
LDI r2, 339
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
