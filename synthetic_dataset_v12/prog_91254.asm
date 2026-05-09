; DESCRIPTION: Creates a cyan circular shape at (177, 60) with radius 60.
; PLAN: r0=177(x), r1=60(y), r2=60(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 177
LDI r1, 60
LDI r2, 60
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
