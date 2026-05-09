; DESCRIPTION: Creates a cyan circular shape at (207, 128) with radius 67.
; PLAN: r0=207(x), r1=128(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 128
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
