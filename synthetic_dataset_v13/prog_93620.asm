; DESCRIPTION: Creates a cyan circular shape at (423, 170) with radius 72.
; PLAN: r0=423(x), r1=170(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 423
LDI r1, 170
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
