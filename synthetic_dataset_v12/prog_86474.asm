; DESCRIPTION: Renders a black disk with center (453, 210) and radius 32.
; PLAN: r0=453(x), r1=210(y), r2=32(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 453
LDI r1, 210
LDI r2, 32
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
