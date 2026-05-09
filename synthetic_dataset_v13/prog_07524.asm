; DESCRIPTION: Renders a white disk with center (366, 221) and radius 29.
; PLAN: r0=366(x), r1=221(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 366
LDI r1, 221
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
