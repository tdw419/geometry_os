; DESCRIPTION: Creates a cyan circular shape at (338, 110) with radius 72.
; PLAN: r0=338(x), r1=110(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 338
LDI r1, 110
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
