; DESCRIPTION: Creates a green circular shape at (121, 167) with radius 76.
; PLAN: r0=121(x), r1=167(y), r2=76(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 121
LDI r1, 167
LDI r2, 76
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
