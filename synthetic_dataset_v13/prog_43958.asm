; DESCRIPTION: Renders a black disk with center (121, 124) and radius 47.
; PLAN: r0=121(x), r1=124(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 124
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
