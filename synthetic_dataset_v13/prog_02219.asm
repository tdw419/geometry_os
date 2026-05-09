; DESCRIPTION: Creates a cyan circular shape at (458, 150) with radius 49.
; PLAN: r0=458(x), r1=150(y), r2=49(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 150
LDI r2, 49
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
