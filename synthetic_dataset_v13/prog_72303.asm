; DESCRIPTION: Renders a white disk with center (302, 221) and radius 20.
; PLAN: r0=302(x), r1=221(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 302
LDI r1, 221
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
