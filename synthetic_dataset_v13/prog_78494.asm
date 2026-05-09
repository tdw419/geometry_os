; DESCRIPTION: Creates a cyan circular shape at (364, 161) with radius 11.
; PLAN: r0=364(x), r1=161(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 364
LDI r1, 161
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
