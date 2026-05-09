; DESCRIPTION: Creates a cyan circular shape at (149, 82) with radius 15.
; PLAN: r0=149(x), r1=82(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 82
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
