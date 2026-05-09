; DESCRIPTION: Renders a orange disk with center (56, 122) and radius 42.
; PLAN: r0=56(x), r1=122(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 56
LDI r1, 122
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
