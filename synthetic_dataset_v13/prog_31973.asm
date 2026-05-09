; DESCRIPTION: Renders a yellow disk with center (246, 149) and radius 67.
; PLAN: r0=246(x), r1=149(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 246
LDI r1, 149
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
