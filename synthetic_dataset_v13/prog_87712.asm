; DESCRIPTION: Creates a orange circular shape at (256, 149) with radius 71.
; PLAN: r0=256(x), r1=149(y), r2=71(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 256
LDI r1, 149
LDI r2, 71
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
