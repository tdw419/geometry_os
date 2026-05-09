; DESCRIPTION: Draws a yellow circle centered at (458, 195) with radius 45.
; PLAN: r0=458(x), r1=195(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 458
LDI r1, 195
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
