; DESCRIPTION: Creates a cyan circular shape at (101, 20) with radius 19.
; PLAN: r0=101(x), r1=20(y), r2=19(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 20
LDI r2, 19
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
