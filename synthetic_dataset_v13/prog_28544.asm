; DESCRIPTION: Creates a cyan circular shape at (259, 96) with radius 80.
; PLAN: r0=259(x), r1=96(y), r2=80(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 259
LDI r1, 96
LDI r2, 80
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
