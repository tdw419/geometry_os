; DESCRIPTION: Creates a green circular shape at (406, 128) with radius 67.
; PLAN: r0=406(x), r1=128(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 128
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
