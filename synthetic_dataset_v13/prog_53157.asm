; DESCRIPTION: Creates a red circular shape at (384, 134) with radius 64.
; PLAN: r0=384(x), r1=134(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 134
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
