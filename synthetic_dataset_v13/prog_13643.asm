; DESCRIPTION: Creates a black circular shape at (186, 205) with radius 11.
; PLAN: r0=186(x), r1=205(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 186
LDI r1, 205
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
