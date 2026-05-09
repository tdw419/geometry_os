; DESCRIPTION: Renders a white disk with center (228, 151) and radius 58.
; PLAN: r0=228(x), r1=151(y), r2=58(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 228
LDI r1, 151
LDI r2, 58
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
