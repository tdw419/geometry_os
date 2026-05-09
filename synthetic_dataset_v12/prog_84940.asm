; DESCRIPTION: Creates a red circular shape at (173, 62) with radius 53.
; PLAN: r0=173(x), r1=62(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 62
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
