; DESCRIPTION: Creates a cyan circular shape at (259, 120) with radius 31.
; PLAN: r0=259(x), r1=120(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 120
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
