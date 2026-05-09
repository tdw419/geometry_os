; DESCRIPTION: Creates a white circular shape at (173, 75) with radius 75.
; PLAN: r0=173(x), r1=75(y), r2=75(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 173
LDI r1, 75
LDI r2, 75
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
