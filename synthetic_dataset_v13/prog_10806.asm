; DESCRIPTION: Draws a cyan circle centered at (227, 45) with radius 45.
; PLAN: r0=227(x), r1=45(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 227
LDI r1, 45
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
