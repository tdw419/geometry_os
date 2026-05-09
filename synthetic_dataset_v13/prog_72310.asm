; DESCRIPTION: Creates a black circular shape at (167, 144) with radius 27.
; PLAN: r0=167(x), r1=144(y), r2=27(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 144
LDI r2, 27
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
