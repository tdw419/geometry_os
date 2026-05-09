; DESCRIPTION: Renders a red disk with center (343, 69) and radius 62.
; PLAN: r0=343(x), r1=69(y), r2=62(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 69
LDI r2, 62
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
