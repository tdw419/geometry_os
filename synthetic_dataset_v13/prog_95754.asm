; DESCRIPTION: Creates a green circular shape at (333, 199) with radius 57.
; PLAN: r0=333(x), r1=199(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 333
LDI r1, 199
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
