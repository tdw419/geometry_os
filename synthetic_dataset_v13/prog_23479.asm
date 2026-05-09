; DESCRIPTION: Creates a black circular shape at (172, 212) with radius 36.
; PLAN: r0=172(x), r1=212(y), r2=36(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 172
LDI r1, 212
LDI r2, 36
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
