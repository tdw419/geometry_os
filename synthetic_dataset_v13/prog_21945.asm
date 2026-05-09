; DESCRIPTION: Renders a black disk with center (121, 135) and radius 67.
; PLAN: r0=121(x), r1=135(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 135
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
