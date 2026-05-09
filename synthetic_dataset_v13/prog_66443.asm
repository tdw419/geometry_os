; DESCRIPTION: Renders a black disk with center (256, 126) and radius 64.
; PLAN: r0=256(x), r1=126(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 126
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
