; DESCRIPTION: Creates a cyan circular shape at (81, 82) with radius 77.
; PLAN: r0=81(x), r1=82(y), r2=77(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 81
LDI r1, 82
LDI r2, 77
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
