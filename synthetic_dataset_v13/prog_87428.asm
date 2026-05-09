; DESCRIPTION: Creates a cyan circular shape at (110, 73) with radius 65.
; PLAN: r0=110(x), r1=73(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 110
LDI r1, 73
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
