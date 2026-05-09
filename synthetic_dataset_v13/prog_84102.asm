; DESCRIPTION: Creates a cyan circular shape at (188, 172) with radius 77.
; PLAN: r0=188(x), r1=172(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 188
LDI r1, 172
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
