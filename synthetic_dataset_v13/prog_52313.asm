; DESCRIPTION: Creates a yellow circular shape at (171, 167) with radius 26.
; PLAN: r0=171(x), r1=167(y), r2=26(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 171
LDI r1, 167
LDI r2, 26
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
