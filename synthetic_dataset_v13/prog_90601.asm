; DESCRIPTION: Creates a cyan circular shape at (191, 30) with radius 11.
; PLAN: r0=191(x), r1=30(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 191
LDI r1, 30
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
