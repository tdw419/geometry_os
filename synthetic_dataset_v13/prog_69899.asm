; DESCRIPTION: Creates a cyan circular shape at (86, 76) with radius 42.
; PLAN: r0=86(x), r1=76(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 86
LDI r1, 76
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
