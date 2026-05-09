; DESCRIPTION: Creates a cyan circular shape at (385, 49) with radius 49.
; PLAN: r0=385(x), r1=49(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 49
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
