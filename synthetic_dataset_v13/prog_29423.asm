; DESCRIPTION: Creates a cyan circular shape at (406, 205) with radius 31.
; PLAN: r0=406(x), r1=205(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 205
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
