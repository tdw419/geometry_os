; DESCRIPTION: Creates a cyan circular shape at (25, 106) with radius 24.
; PLAN: r0=25(x), r1=106(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 25
LDI r1, 106
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
