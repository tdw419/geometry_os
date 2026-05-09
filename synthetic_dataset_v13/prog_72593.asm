; DESCRIPTION: Renders a orange disk with center (67, 86) and radius 58.
; PLAN: r0=67(x), r1=86(y), r2=58(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 86
LDI r2, 58
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
