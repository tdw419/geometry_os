; DESCRIPTION: Draws a cyan circle centered at (312, 175) with radius 76.
; PLAN: r0=312(x), r1=175(y), r2=76(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 312
LDI r1, 175
LDI r2, 76
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
