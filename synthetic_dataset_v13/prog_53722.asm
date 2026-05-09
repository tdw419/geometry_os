; DESCRIPTION: Renders a black disk with center (242, 140) and radius 24.
; PLAN: r0=242(x), r1=140(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 140
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
