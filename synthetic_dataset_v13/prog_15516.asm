; DESCRIPTION: Creates a cyan circular shape at (93, 176) with radius 68.
; PLAN: r0=93(x), r1=176(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 93
LDI r1, 176
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
