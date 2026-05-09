; DESCRIPTION: Renders a white disk with center (270, 131) and radius 62.
; PLAN: r0=270(x), r1=131(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 270
LDI r1, 131
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
