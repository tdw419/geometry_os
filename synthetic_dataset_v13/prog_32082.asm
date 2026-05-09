; DESCRIPTION: Creates a red circular shape at (326, 53) with radius 14.
; PLAN: r0=326(x), r1=53(y), r2=14(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 326
LDI r1, 53
LDI r2, 14
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
