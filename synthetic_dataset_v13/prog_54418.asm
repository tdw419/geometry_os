; DESCRIPTION: Renders a orange disk with center (265, 142) and radius 29.
; PLAN: r0=265(x), r1=142(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 142
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
