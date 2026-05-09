; DESCRIPTION: Renders a black disk with center (196, 121) and radius 43.
; PLAN: r0=196(x), r1=121(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 196
LDI r1, 121
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
