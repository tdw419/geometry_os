; DESCRIPTION: Renders a white disk with center (196, 53) and radius 45.
; PLAN: r0=196(x), r1=53(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 53
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
