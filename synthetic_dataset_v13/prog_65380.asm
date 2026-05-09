; DESCRIPTION: Creates a cyan circular shape at (42, 56) with radius 42.
; PLAN: r0=42(x), r1=56(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 56
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
