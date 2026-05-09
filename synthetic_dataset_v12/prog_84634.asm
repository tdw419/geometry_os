; DESCRIPTION: Creates a red circular shape at (469, 192) with radius 35.
; PLAN: r0=469(x), r1=192(y), r2=35(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 469
LDI r1, 192
LDI r2, 35
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
