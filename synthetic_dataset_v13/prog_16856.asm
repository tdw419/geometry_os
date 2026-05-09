; DESCRIPTION: Renders a orange disk with center (181, 67) and radius 23.
; PLAN: r0=181(x), r1=67(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 181
LDI r1, 67
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
