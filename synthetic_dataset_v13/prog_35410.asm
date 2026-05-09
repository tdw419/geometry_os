; DESCRIPTION: Creates a green circular shape at (240, 171) with radius 73.
; PLAN: r0=240(x), r1=171(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 240
LDI r1, 171
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
