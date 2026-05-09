; DESCRIPTION: Renders a black disk with center (202, 121) and radius 64.
; PLAN: r0=202(x), r1=121(y), r2=64(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 121
LDI r2, 64
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
