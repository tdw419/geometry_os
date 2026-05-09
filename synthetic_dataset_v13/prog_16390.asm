; DESCRIPTION: Renders a orange disk with center (234, 69) and radius 42.
; PLAN: r0=234(x), r1=69(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 234
LDI r1, 69
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
