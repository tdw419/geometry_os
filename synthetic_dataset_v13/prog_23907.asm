; DESCRIPTION: Creates a cyan circular shape at (32, 179) with radius 25.
; PLAN: r0=32(x), r1=179(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 32
LDI r1, 179
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
