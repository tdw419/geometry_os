; DESCRIPTION: Renders a white disk with center (164, 108) and radius 69.
; PLAN: r0=164(x), r1=108(y), r2=69(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 108
LDI r2, 69
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
