; DESCRIPTION: Renders a white disk with center (382, 202) and radius 50.
; PLAN: r0=382(x), r1=202(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 382
LDI r1, 202
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
