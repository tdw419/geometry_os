; DESCRIPTION: Creates a black circular shape at (479, 85) with radius 22.
; PLAN: r0=479(x), r1=85(y), r2=22(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 479
LDI r1, 85
LDI r2, 22
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
