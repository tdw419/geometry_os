; DESCRIPTION: Creates a cyan circular shape at (25, 73) with radius 22.
; PLAN: r0=25(x), r1=73(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 73
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
