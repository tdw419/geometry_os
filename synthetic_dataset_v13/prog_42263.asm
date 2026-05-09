; DESCRIPTION: Creates a white circular shape at (282, 144) with radius 20.
; PLAN: r0=282(x), r1=144(y), r2=20(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 144
LDI r2, 20
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
