; DESCRIPTION: Creates a black circular shape at (442, 173) with radius 16.
; PLAN: r0=442(x), r1=173(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 173
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
