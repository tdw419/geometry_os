; DESCRIPTION: Creates a green circular shape at (261, 171) with radius 38.
; PLAN: r0=261(x), r1=171(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 261
LDI r1, 171
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
