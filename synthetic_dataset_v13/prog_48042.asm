; DESCRIPTION: Renders a orange disk with center (166, 72) and radius 39.
; PLAN: r0=166(x), r1=72(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 72
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
