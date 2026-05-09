; DESCRIPTION: Creates a cyan circular shape at (406, 83) with radius 78.
; PLAN: r0=406(x), r1=83(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 406
LDI r1, 83
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
