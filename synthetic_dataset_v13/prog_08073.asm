; DESCRIPTION: Creates a cyan circular shape at (96, 42) with radius 20.
; PLAN: r0=96(x), r1=42(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 42
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
