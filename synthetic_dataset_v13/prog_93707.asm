; DESCRIPTION: Creates a cyan circular shape at (311, 86) with radius 62.
; PLAN: r0=311(x), r1=86(y), r2=62(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 311
LDI r1, 86
LDI r2, 62
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
