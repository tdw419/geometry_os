; DESCRIPTION: Renders a white disk with center (141, 166) and radius 66.
; PLAN: r0=141(x), r1=166(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 166
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
