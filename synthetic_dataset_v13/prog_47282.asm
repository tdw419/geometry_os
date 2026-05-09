; DESCRIPTION: Renders a white disk with center (397, 73) and radius 50.
; PLAN: r0=397(x), r1=73(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 397
LDI r1, 73
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
