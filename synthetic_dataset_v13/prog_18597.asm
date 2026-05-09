; DESCRIPTION: Creates a red circular shape at (476, 226) with radius 26.
; PLAN: r0=476(x), r1=226(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 226
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
