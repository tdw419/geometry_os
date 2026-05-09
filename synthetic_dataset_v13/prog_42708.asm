; DESCRIPTION: Draws a cyan circle centered at (217, 136) with radius 43.
; PLAN: r0=217(x), r1=136(y), r2=43(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 217
LDI r1, 136
LDI r2, 43
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
