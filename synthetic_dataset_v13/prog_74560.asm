; DESCRIPTION: Renders a white disk with center (87, 80) and radius 69.
; PLAN: r0=87(x), r1=80(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 87
LDI r1, 80
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
