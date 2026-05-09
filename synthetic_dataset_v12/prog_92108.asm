; DESCRIPTION: Renders a black disk with center (101, 128) and radius 36.
; PLAN: r0=101(x), r1=128(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 128
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
