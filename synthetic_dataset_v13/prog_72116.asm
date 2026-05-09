; DESCRIPTION: Renders a white disk with center (161, 202) and radius 43.
; PLAN: r0=161(x), r1=202(y), r2=43(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 202
LDI r2, 43
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
