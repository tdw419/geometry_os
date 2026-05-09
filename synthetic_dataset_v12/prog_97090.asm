; DESCRIPTION: Renders a black disk with center (101, 164) and radius 46.
; PLAN: r0=101(x), r1=164(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 164
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
