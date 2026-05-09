; DESCRIPTION: Creates a cyan circular shape at (138, 24) with radius 22.
; PLAN: r0=138(x), r1=24(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 138
LDI r1, 24
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
