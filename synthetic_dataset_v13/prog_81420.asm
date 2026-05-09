; DESCRIPTION: Creates a cyan circular shape at (153, 170) with radius 54.
; PLAN: r0=153(x), r1=170(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 153
LDI r1, 170
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
