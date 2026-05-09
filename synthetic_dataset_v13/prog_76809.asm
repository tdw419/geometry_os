; DESCRIPTION: Creates a orange circular shape at (136, 108) with radius 65.
; PLAN: r0=136(x), r1=108(y), r2=65(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 136
LDI r1, 108
LDI r2, 65
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
