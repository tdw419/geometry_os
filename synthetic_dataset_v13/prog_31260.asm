; DESCRIPTION: Renders a white disk with center (193, 134) and radius 38.
; PLAN: r0=193(x), r1=134(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 134
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
