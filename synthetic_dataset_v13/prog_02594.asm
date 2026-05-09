; DESCRIPTION: Places a orange circle of radius 14 at center (335, 160).
; PLAN: r0=335(x), r1=160(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 160
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
