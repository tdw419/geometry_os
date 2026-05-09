; DESCRIPTION: Renders a orange disk with center (335, 139) and radius 42.
; PLAN: r0=335(x), r1=139(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 335
LDI r1, 139
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
