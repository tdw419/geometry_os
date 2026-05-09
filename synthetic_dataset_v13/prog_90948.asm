; DESCRIPTION: Creates a cyan circular shape at (381, 198) with radius 53.
; PLAN: r0=381(x), r1=198(y), r2=53(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 381
LDI r1, 198
LDI r2, 53
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
