; DESCRIPTION: Creates a cyan circular shape at (286, 89) with radius 48.
; PLAN: r0=286(x), r1=89(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 286
LDI r1, 89
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
