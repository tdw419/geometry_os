; DESCRIPTION: Creates a cyan circular shape at (318, 67) with radius 54.
; PLAN: r0=318(x), r1=67(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 318
LDI r1, 67
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
