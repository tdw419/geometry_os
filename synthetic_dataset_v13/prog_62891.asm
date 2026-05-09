; DESCRIPTION: Creates a cyan circular shape at (312, 121) with radius 32.
; PLAN: r0=312(x), r1=121(y), r2=32(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 121
LDI r2, 32
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
