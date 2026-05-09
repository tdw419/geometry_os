; DESCRIPTION: Renders a white disk with center (252, 146) and radius 60.
; PLAN: r0=252(x), r1=146(y), r2=60(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 252
LDI r1, 146
LDI r2, 60
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
