; DESCRIPTION: Renders a black disk with center (417, 173) and radius 78.
; PLAN: r0=417(x), r1=173(y), r2=78(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 173
LDI r2, 78
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
