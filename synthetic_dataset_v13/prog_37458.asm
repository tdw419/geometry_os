; DESCRIPTION: Places a white line segment connecting (497, 173) to (378, 130).
; PLAN: r0=497(x1), r1=173(y1), r2=378(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 173
LDI r2, 378
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
