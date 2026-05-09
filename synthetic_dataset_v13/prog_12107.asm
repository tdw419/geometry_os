; DESCRIPTION: Draws a orange circle centered at (141, 215) with radius 33.
; PLAN: r0=141(x), r1=215(y), r2=33(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 141
LDI r1, 215
LDI r2, 33
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
