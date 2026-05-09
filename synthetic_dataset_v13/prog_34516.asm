; DESCRIPTION: Creates a green circular shape at (383, 165) with radius 60.
; PLAN: r0=383(x), r1=165(y), r2=60(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 383
LDI r1, 165
LDI r2, 60
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
