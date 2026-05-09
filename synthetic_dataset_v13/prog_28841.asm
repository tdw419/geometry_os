; DESCRIPTION: Creates a cyan circular shape at (202, 142) with radius 75.
; PLAN: r0=202(x), r1=142(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 142
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
