; DESCRIPTION: Renders a black disk with center (90, 164) and radius 24.
; PLAN: r0=90(x), r1=164(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 90
LDI r1, 164
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
