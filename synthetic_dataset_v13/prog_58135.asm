; DESCRIPTION: Creates a cyan circular shape at (291, 114) with radius 25.
; PLAN: r0=291(x), r1=114(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 291
LDI r1, 114
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
