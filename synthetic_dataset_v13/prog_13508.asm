; DESCRIPTION: Creates a cyan circular shape at (221, 156) with radius 47.
; PLAN: r0=221(x), r1=156(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 156
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
