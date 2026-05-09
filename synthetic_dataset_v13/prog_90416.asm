; DESCRIPTION: Renders a black disk with center (69, 141) and radius 53.
; PLAN: r0=69(x), r1=141(y), r2=53(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 69
LDI r1, 141
LDI r2, 53
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
