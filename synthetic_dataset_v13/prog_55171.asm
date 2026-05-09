; DESCRIPTION: Creates a cyan circular shape at (117, 83) with radius 53.
; PLAN: r0=117(x), r1=83(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 83
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
