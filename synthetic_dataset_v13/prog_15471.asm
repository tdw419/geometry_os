; DESCRIPTION: Renders a white disk with center (265, 111) and radius 61.
; PLAN: r0=265(x), r1=111(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 265
LDI r1, 111
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
