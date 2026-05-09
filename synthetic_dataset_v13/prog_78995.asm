; DESCRIPTION: Renders a white disk with center (123, 172) and radius 52.
; PLAN: r0=123(x), r1=172(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 172
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
