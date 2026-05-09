; DESCRIPTION: Draws a cyan circle centered at (325, 88) with radius 65.
; PLAN: r0=325(x), r1=88(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 325
LDI r1, 88
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
