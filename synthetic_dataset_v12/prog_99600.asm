; DESCRIPTION: Renders a orange disk with center (213, 144) and radius 62.
; PLAN: r0=213(x), r1=144(y), r2=62(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 213
LDI r1, 144
LDI r2, 62
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
