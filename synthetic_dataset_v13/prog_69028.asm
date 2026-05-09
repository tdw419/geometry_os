; DESCRIPTION: Renders a white disk with center (182, 167) and radius 35.
; PLAN: r0=182(x), r1=167(y), r2=35(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 167
LDI r2, 35
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
