; DESCRIPTION: Creates a cyan circular shape at (78, 131) with radius 49.
; PLAN: r0=78(x), r1=131(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 78
LDI r1, 131
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
