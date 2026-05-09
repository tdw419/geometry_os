; DESCRIPTION: Creates a red circular shape at (384, 43) with radius 25.
; PLAN: r0=384(x), r1=43(y), r2=25(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 43
LDI r2, 25
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
