; DESCRIPTION: Creates a black circular shape at (214, 108) with radius 79.
; PLAN: r0=214(x), r1=108(y), r2=79(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 214
LDI r1, 108
LDI r2, 79
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
