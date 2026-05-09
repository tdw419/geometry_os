; DESCRIPTION: Creates a cyan circular shape at (407, 162) with radius 26.
; PLAN: r0=407(x), r1=162(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 407
LDI r1, 162
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
