; DESCRIPTION: Renders a black disk with center (346, 130) and radius 21.
; PLAN: r0=346(x), r1=130(y), r2=21(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 346
LDI r1, 130
LDI r2, 21
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
