; DESCRIPTION: Creates a cyan circular shape at (122, 101) with radius 21.
; PLAN: r0=122(x), r1=101(y), r2=21(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 122
LDI r1, 101
LDI r2, 21
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
