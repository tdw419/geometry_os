; DESCRIPTION: Renders a white disk with center (245, 141) and radius 71.
; PLAN: r0=245(x), r1=141(y), r2=71(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 141
LDI r2, 71
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
