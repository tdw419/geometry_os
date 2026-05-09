; DESCRIPTION: Creates a cyan circular shape at (439, 106) with radius 40.
; PLAN: r0=439(x), r1=106(y), r2=40(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 439
LDI r1, 106
LDI r2, 40
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
