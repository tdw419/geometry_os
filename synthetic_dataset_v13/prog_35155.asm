; DESCRIPTION: Creates a green circular shape at (380, 167) with radius 38.
; PLAN: r0=380(x), r1=167(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 380
LDI r1, 167
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
