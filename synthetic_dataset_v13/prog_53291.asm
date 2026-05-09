; DESCRIPTION: Creates a cyan circular shape at (287, 55) with radius 49.
; PLAN: r0=287(x), r1=55(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 287
LDI r1, 55
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
