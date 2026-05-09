; DESCRIPTION: Creates a green circular shape at (291, 48) with radius 27.
; PLAN: r0=291(x), r1=48(y), r2=27(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 48
LDI r2, 27
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
