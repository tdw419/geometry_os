; DESCRIPTION: Renders a orange disk with center (375, 166) and radius 67.
; PLAN: r0=375(x), r1=166(y), r2=67(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 375
LDI r1, 166
LDI r2, 67
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
