; DESCRIPTION: Renders a white disk with center (378, 42) and radius 11.
; PLAN: r0=378(x), r1=42(y), r2=11(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 378
LDI r1, 42
LDI r2, 11
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
