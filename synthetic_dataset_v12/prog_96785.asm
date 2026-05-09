; DESCRIPTION: Renders a yellow disk with center (264, 142) and radius 67.
; PLAN: r0=264(x), r1=142(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 264
LDI r1, 142
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
