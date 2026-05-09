; DESCRIPTION: Creates a orange circular shape at (238, 195) with radius 22.
; PLAN: r0=238(x), r1=195(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 238
LDI r1, 195
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
