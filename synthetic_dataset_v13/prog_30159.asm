; DESCRIPTION: Creates a red circular shape at (282, 96) with radius 20.
; PLAN: r0=282(x), r1=96(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 282
LDI r1, 96
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
