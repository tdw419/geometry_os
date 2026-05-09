; DESCRIPTION: Renders a black disk with center (214, 97) and radius 69.
; PLAN: r0=214(x), r1=97(y), r2=69(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 97
LDI r2, 69
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
