; DESCRIPTION: Renders a white disk with center (411, 164) and radius 19.
; PLAN: r0=411(x), r1=164(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 164
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
