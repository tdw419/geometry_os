; DESCRIPTION: Creates a green circular shape at (173, 136) with radius 77.
; PLAN: r0=173(x), r1=136(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 136
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
