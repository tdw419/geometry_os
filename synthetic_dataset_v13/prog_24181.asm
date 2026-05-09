; DESCRIPTION: Creates a cyan circular shape at (167, 156) with radius 59.
; PLAN: r0=167(x), r1=156(y), r2=59(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 167
LDI r1, 156
LDI r2, 59
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
