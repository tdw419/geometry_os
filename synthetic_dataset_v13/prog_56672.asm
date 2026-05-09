; DESCRIPTION: Creates a green circular shape at (140, 161) with radius 57.
; PLAN: r0=140(x), r1=161(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 140
LDI r1, 161
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
