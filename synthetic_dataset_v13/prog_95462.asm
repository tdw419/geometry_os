; DESCRIPTION: Renders a white disk with center (245, 226) and radius 28.
; PLAN: r0=245(x), r1=226(y), r2=28(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 245
LDI r1, 226
LDI r2, 28
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
