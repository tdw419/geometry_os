; DESCRIPTION: Creates a green circular shape at (259, 173) with radius 19.
; PLAN: r0=259(x), r1=173(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 173
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
