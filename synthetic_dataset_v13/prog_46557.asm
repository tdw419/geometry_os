; DESCRIPTION: Creates a green circular shape at (441, 67) with radius 57.
; PLAN: r0=441(x), r1=67(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 67
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
