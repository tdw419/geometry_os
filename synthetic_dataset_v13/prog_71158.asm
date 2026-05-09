; DESCRIPTION: Draws a cyan circle centered at (289, 45) with radius 24.
; PLAN: r0=289(x), r1=45(y), r2=24(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 289
LDI r1, 45
LDI r2, 24
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
