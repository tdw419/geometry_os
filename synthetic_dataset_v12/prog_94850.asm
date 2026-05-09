; DESCRIPTION: Renders a blue disk with center (178, 165) and radius 24.
; PLAN: r0=178(x), r1=165(y), r2=24(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 178
LDI r1, 165
LDI r2, 24
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
