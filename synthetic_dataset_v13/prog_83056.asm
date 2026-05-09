; DESCRIPTION: Creates a black circular shape at (161, 65) with radius 63.
; PLAN: r0=161(x), r1=65(y), r2=63(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 65
LDI r2, 63
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
