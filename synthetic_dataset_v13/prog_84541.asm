; DESCRIPTION: Creates a cyan circular shape at (376, 170) with radius 50.
; PLAN: r0=376(x), r1=170(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 376
LDI r1, 170
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
