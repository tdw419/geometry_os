; DESCRIPTION: Creates a green circular shape at (71, 149) with radius 64.
; PLAN: r0=71(x), r1=149(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 71
LDI r1, 149
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
