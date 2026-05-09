; DESCRIPTION: Places a cyan circle of radius 31 at center (343, 156).
; PLAN: r0=343(x), r1=156(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 343
LDI r1, 156
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
