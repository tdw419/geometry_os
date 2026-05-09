; DESCRIPTION: Creates a cyan circular shape at (272, 68) with radius 20.
; PLAN: r0=272(x), r1=68(y), r2=20(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 272
LDI r1, 68
LDI r2, 20
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
