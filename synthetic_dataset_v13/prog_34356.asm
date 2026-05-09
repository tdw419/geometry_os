; DESCRIPTION: Renders a white disk with center (380, 28) and radius 26.
; PLAN: r0=380(x), r1=28(y), r2=26(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 28
LDI r2, 26
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
