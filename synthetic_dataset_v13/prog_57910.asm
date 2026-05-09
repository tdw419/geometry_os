; DESCRIPTION: Creates a orange circular shape at (417, 139) with radius 25.
; PLAN: r0=417(x), r1=139(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 417
LDI r1, 139
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
