; DESCRIPTION: Creates a green circular shape at (96, 165) with radius 64.
; PLAN: r0=96(x), r1=165(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 165
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
