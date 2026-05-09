; DESCRIPTION: Creates a green circular shape at (429, 149) with radius 15.
; PLAN: r0=429(x), r1=149(y), r2=15(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 429
LDI r1, 149
LDI r2, 15
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
