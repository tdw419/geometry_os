; DESCRIPTION: Creates a cyan circular shape at (205, 81) with radius 72.
; PLAN: r0=205(x), r1=81(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 205
LDI r1, 81
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
