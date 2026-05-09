; DESCRIPTION: Creates a cyan circular shape at (77, 120) with radius 66.
; PLAN: r0=77(x), r1=120(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 77
LDI r1, 120
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
