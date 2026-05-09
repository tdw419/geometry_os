; DESCRIPTION: Renders a black disk with center (444, 221) and radius 24.
; PLAN: r0=444(x), r1=221(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 444
LDI r1, 221
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
