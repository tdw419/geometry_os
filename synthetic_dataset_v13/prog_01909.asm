; DESCRIPTION: Renders a white disk with center (276, 154) and radius 73.
; PLAN: r0=276(x), r1=154(y), r2=73(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 276
LDI r1, 154
LDI r2, 73
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
