; DESCRIPTION: Renders a black disk with center (82, 39) and radius 28.
; PLAN: r0=82(x), r1=39(y), r2=28(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 82
LDI r1, 39
LDI r2, 28
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
