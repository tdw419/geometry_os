; DESCRIPTION: Renders a white disk with center (323, 221) and radius 22.
; PLAN: r0=323(x), r1=221(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 323
LDI r1, 221
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
