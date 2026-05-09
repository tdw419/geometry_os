; DESCRIPTION: Creates a cyan circular shape at (188, 67) with radius 36.
; PLAN: r0=188(x), r1=67(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 67
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
