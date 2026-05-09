; DESCRIPTION: Creates a green circular shape at (268, 67) with radius 24.
; PLAN: r0=268(x), r1=67(y), r2=24(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 268
LDI r1, 67
LDI r2, 24
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
