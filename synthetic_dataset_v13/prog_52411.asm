; DESCRIPTION: Creates a cyan circular shape at (94, 117) with radius 67.
; PLAN: r0=94(x), r1=117(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 94
LDI r1, 117
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
