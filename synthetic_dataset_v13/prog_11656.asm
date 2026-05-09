; DESCRIPTION: Renders a orange disk with center (185, 151) and radius 69.
; PLAN: r0=185(x), r1=151(y), r2=69(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 185
LDI r1, 151
LDI r2, 69
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
