; DESCRIPTION: Creates a cyan circular shape at (364, 176) with radius 60.
; PLAN: r0=364(x), r1=176(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 176
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
