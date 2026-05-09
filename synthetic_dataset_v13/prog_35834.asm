; DESCRIPTION: Creates a cyan circular shape at (59, 170) with radius 59.
; PLAN: r0=59(x), r1=170(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 170
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
