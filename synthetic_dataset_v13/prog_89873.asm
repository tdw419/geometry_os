; DESCRIPTION: Creates a cyan circular shape at (120, 109) with radius 42.
; PLAN: r0=120(x), r1=109(y), r2=42(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 120
LDI r1, 109
LDI r2, 42
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
