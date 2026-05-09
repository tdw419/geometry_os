; DESCRIPTION: Renders a white disk with center (146, 139) and radius 60.
; PLAN: r0=146(x), r1=139(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 146
LDI r1, 139
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
