; DESCRIPTION: Renders a black disk with center (372, 76) and radius 16.
; PLAN: r0=372(x), r1=76(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 372
LDI r1, 76
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
