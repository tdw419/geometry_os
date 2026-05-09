; DESCRIPTION: Creates a cyan circular shape at (89, 166) with radius 56.
; PLAN: r0=89(x), r1=166(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 166
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
