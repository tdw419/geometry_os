; DESCRIPTION: Renders a orange disk with center (220, 67) and radius 23.
; PLAN: r0=220(x), r1=67(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 220
LDI r1, 67
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
