; DESCRIPTION: Creates a cyan circular shape at (390, 73) with radius 26.
; PLAN: r0=390(x), r1=73(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 390
LDI r1, 73
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
