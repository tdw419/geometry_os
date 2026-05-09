; DESCRIPTION: Creates a cyan circular shape at (427, 159) with radius 71.
; PLAN: r0=427(x), r1=159(y), r2=71(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 427
LDI r1, 159
LDI r2, 71
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
