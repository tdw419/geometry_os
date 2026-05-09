; DESCRIPTION: Draws a cyan circle centered at (147, 122) with radius 73.
; PLAN: r0=147(x), r1=122(y), r2=73(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 122
LDI r2, 73
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
