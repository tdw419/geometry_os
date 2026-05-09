; DESCRIPTION: Creates a green circular shape at (141, 167) with radius 50.
; PLAN: r0=141(x), r1=167(y), r2=50(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 167
LDI r2, 50
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
