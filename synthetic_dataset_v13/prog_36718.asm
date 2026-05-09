; DESCRIPTION: Places a white line segment connecting (83, 88) to (378, 29).
; PLAN: r0=83(x1), r1=88(y1), r2=378(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 88
LDI r2, 378
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
