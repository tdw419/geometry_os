; DESCRIPTION: Creates a cyan circular shape at (149, 159) with radius 66.
; PLAN: r0=149(x), r1=159(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 149
LDI r1, 159
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
