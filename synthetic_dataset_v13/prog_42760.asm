; DESCRIPTION: Creates a cyan circular shape at (411, 114) with radius 43.
; PLAN: r0=411(x), r1=114(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 411
LDI r1, 114
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
