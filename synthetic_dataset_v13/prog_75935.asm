; DESCRIPTION: Draws a cyan circle centered at (31, 192) with radius 15.
; PLAN: r0=31(x), r1=192(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 31
LDI r1, 192
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
