; DESCRIPTION: Creates a cyan circular shape at (207, 93) with radius 58.
; PLAN: r0=207(x), r1=93(y), r2=58(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 93
LDI r2, 58
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
