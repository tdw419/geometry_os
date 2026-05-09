; DESCRIPTION: Renders a orange disk with center (253, 112) and radius 34.
; PLAN: r0=253(x), r1=112(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 253
LDI r1, 112
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
