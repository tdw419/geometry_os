; DESCRIPTION: Creates a cyan circular shape at (250, 116) with radius 47.
; PLAN: r0=250(x), r1=116(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 116
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
