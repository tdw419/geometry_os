; DESCRIPTION: Renders a blue disk with center (407, 123) and radius 27.
; PLAN: r0=407(x), r1=123(y), r2=27(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 123
LDI r2, 27
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
