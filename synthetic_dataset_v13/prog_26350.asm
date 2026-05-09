; DESCRIPTION: Creates a cyan circular shape at (101, 214) with radius 37.
; PLAN: r0=101(x), r1=214(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 101
LDI r1, 214
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
