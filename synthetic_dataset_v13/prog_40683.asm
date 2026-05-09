; DESCRIPTION: Creates a cyan circular shape at (155, 121) with radius 42.
; PLAN: r0=155(x), r1=121(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 155
LDI r1, 121
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
