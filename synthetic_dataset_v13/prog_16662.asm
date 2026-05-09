; DESCRIPTION: Creates a cyan circular shape at (176, 19) with radius 15.
; PLAN: r0=176(x), r1=19(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 176
LDI r1, 19
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
