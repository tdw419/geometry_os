; DESCRIPTION: Creates a cyan circular shape at (247, 123) with radius 26.
; PLAN: r0=247(x), r1=123(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 247
LDI r1, 123
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
