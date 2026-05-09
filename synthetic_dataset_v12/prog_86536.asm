; DESCRIPTION: Renders a orange disk with center (83, 126) and radius 16.
; PLAN: r0=83(x), r1=126(y), r2=16(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 83
LDI r1, 126
LDI r2, 16
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
