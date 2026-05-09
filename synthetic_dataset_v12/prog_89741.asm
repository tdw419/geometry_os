; DESCRIPTION: Renders a orange disk with center (69, 93) and radius 60.
; PLAN: r0=69(x), r1=93(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 93
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
