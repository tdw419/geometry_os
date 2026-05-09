; DESCRIPTION: Renders a white disk with center (123, 199) and radius 54.
; PLAN: r0=123(x), r1=199(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 123
LDI r1, 199
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
