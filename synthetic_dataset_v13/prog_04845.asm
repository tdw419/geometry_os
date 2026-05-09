; DESCRIPTION: Creates a cyan circular shape at (314, 118) with radius 66.
; PLAN: r0=314(x), r1=118(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 118
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
