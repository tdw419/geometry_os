; DESCRIPTION: Creates a cyan circular shape at (454, 67) with radius 44.
; PLAN: r0=454(x), r1=67(y), r2=44(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 454
LDI r1, 67
LDI r2, 44
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
