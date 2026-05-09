; DESCRIPTION: Renders a black disk with center (64, 164) and radius 62.
; PLAN: r0=64(x), r1=164(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 64
LDI r1, 164
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
