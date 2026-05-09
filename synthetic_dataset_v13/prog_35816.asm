; DESCRIPTION: Renders a green disk with center (375, 132) and radius 67.
; PLAN: r0=375(x), r1=132(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 132
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
