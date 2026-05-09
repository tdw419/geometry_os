; DESCRIPTION: Renders a black disk with center (435, 116) and radius 57.
; PLAN: r0=435(x), r1=116(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 116
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
