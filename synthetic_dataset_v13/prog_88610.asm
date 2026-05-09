; DESCRIPTION: Creates a cyan circular shape at (138, 119) with radius 11.
; PLAN: r0=138(x), r1=119(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 119
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
