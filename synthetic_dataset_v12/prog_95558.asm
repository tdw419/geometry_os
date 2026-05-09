; DESCRIPTION: Renders a white disk with center (317, 117) and radius 49.
; PLAN: r0=317(x), r1=117(y), r2=49(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 317
LDI r1, 117
LDI r2, 49
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
