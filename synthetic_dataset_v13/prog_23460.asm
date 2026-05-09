; DESCRIPTION: Creates a cyan circular shape at (96, 110) with radius 13.
; PLAN: r0=96(x), r1=110(y), r2=13(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 96
LDI r1, 110
LDI r2, 13
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
