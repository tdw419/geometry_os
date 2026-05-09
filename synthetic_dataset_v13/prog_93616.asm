; DESCRIPTION: Renders a white disk with center (197, 138) and radius 80.
; PLAN: r0=197(x), r1=138(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 138
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
