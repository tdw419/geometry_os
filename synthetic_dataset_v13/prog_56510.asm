; DESCRIPTION: Renders a white disk with center (215, 138) and radius 62.
; PLAN: r0=215(x), r1=138(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 138
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
