; DESCRIPTION: Renders a black disk with center (167, 126) and radius 48.
; PLAN: r0=167(x), r1=126(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 126
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
