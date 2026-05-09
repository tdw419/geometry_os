; DESCRIPTION: Creates a yellow circular shape at (476, 171) with radius 36.
; PLAN: r0=476(x), r1=171(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 476
LDI r1, 171
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
