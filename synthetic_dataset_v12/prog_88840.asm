; DESCRIPTION: Renders a red disk with center (293, 130) and radius 72.
; PLAN: r0=293(x), r1=130(y), r2=72(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 293
LDI r1, 130
LDI r2, 72
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
