; DESCRIPTION: Creates a green circular shape at (81, 167) with radius 57.
; PLAN: r0=81(x), r1=167(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 167
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
