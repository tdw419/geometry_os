; DESCRIPTION: Renders a orange disk with center (378, 85) and radius 64.
; PLAN: r0=378(x), r1=85(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 85
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
