; DESCRIPTION: Creates a cyan circular shape at (312, 100) with radius 75.
; PLAN: r0=312(x), r1=100(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 100
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
