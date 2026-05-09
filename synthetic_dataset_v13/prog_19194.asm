; DESCRIPTION: Creates a cyan circular shape at (42, 181) with radius 10.
; PLAN: r0=42(x), r1=181(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 42
LDI r1, 181
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
