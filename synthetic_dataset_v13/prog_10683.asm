; DESCRIPTION: Renders a black disk with center (59, 135) and radius 39.
; PLAN: r0=59(x), r1=135(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 135
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
