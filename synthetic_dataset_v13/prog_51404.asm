; DESCRIPTION: Renders a red disk with center (371, 130) and radius 67.
; PLAN: r0=371(x), r1=130(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 371
LDI r1, 130
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
