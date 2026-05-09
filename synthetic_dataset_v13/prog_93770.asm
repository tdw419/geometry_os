; DESCRIPTION: Creates a black circular shape at (428, 173) with radius 73.
; PLAN: r0=428(x), r1=173(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 428
LDI r1, 173
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
