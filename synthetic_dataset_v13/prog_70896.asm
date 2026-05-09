; DESCRIPTION: Renders a orange disk with center (276, 83) and radius 31.
; PLAN: r0=276(x), r1=83(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 83
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
