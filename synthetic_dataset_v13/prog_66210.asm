; DESCRIPTION: Places a cyan circle of radius 66 at center (183, 93).
; PLAN: r0=183(x), r1=93(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 183
LDI r1, 93
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
