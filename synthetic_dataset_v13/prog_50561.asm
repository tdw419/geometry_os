; DESCRIPTION: Places a orange line segment connecting (83, 17) to (425, 30).
; PLAN: r0=83(x1), r1=17(y1), r2=425(x2), r3=30(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 17
LDI r2, 425
LDI r3, 30
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
