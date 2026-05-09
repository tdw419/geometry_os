; DESCRIPTION: Renders a white disk with center (276, 157) and radius 56.
; PLAN: r0=276(x), r1=157(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 157
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
