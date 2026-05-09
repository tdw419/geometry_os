; DESCRIPTION: Creates a red circular shape at (258, 143) with radius 74.
; PLAN: r0=258(x), r1=143(y), r2=74(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 258
LDI r1, 143
LDI r2, 74
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
