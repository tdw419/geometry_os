; DESCRIPTION: Creates a red circular shape at (263, 176) with radius 53.
; PLAN: r0=263(x), r1=176(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 263
LDI r1, 176
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
