; DESCRIPTION: Renders a white disk with center (286, 168) and radius 45.
; PLAN: r0=286(x), r1=168(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 168
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
