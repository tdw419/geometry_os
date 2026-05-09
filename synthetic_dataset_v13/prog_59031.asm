; DESCRIPTION: Renders a white disk with center (166, 103) and radius 52.
; PLAN: r0=166(x), r1=103(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 103
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
