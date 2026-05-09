; DESCRIPTION: Renders a red disk with center (109, 103) and radius 69.
; PLAN: r0=109(x), r1=103(y), r2=69(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 109
LDI r1, 103
LDI r2, 69
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
