; DESCRIPTION: Creates a cyan circular shape at (337, 119) with radius 34.
; PLAN: r0=337(x), r1=119(y), r2=34(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 337
LDI r1, 119
LDI r2, 34
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
