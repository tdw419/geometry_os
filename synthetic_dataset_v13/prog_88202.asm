; DESCRIPTION: Creates a cyan circular shape at (207, 162) with radius 75.
; PLAN: r0=207(x), r1=162(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 207
LDI r1, 162
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
