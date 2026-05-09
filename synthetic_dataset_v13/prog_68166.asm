; DESCRIPTION: Renders a black disk with center (249, 180) and radius 73.
; PLAN: r0=249(x), r1=180(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 249
LDI r1, 180
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
