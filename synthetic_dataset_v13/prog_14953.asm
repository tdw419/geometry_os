; DESCRIPTION: Creates a cyan circular shape at (223, 81) with radius 45.
; PLAN: r0=223(x), r1=81(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 223
LDI r1, 81
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
