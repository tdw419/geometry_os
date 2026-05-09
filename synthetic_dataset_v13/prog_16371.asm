; DESCRIPTION: Creates a cyan circular shape at (425, 106) with radius 50.
; PLAN: r0=425(x), r1=106(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 425
LDI r1, 106
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
