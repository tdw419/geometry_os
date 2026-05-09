; DESCRIPTION: Places a orange circle of radius 47 at center (378, 185).
; PLAN: r0=378(x), r1=185(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 185
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
