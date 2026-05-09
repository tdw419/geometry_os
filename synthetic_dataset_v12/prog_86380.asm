; DESCRIPTION: Draws a cyan circle centered at (285, 172) with radius 37.
; PLAN: r0=285(x), r1=172(y), r2=37(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 285
LDI r1, 172
LDI r2, 37
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
