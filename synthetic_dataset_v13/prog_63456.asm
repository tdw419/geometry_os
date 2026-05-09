; DESCRIPTION: Renders a white disk with center (199, 203) and radius 32.
; PLAN: r0=199(x), r1=203(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 203
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
