; DESCRIPTION: Creates a cyan circular shape at (170, 142) with radius 39.
; PLAN: r0=170(x), r1=142(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 170
LDI r1, 142
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
