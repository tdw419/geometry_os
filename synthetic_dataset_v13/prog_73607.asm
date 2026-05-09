; DESCRIPTION: Renders a black disk with center (305, 113) and radius 61.
; PLAN: r0=305(x), r1=113(y), r2=61(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 305
LDI r1, 113
LDI r2, 61
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
