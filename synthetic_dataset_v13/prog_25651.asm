; DESCRIPTION: Renders a black disk with center (294, 167) and radius 61.
; PLAN: r0=294(x), r1=167(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 167
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
