; DESCRIPTION: Renders a orange disk with center (119, 72) and radius 42.
; PLAN: r0=119(x), r1=72(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 119
LDI r1, 72
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
