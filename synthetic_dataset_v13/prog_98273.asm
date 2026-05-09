; DESCRIPTION: Renders a orange disk with center (328, 130) and radius 29.
; PLAN: r0=328(x), r1=130(y), r2=29(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 130
LDI r2, 29
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
