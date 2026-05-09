; DESCRIPTION: Creates a black circular shape at (214, 173) with radius 39.
; PLAN: r0=214(x), r1=173(y), r2=39(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 173
LDI r2, 39
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
