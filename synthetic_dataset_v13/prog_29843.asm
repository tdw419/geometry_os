; DESCRIPTION: Creates a cyan circular shape at (199, 99) with radius 72.
; PLAN: r0=199(x), r1=99(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 199
LDI r1, 99
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
