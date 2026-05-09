; DESCRIPTION: Draws a green circle centered at (43, 215) with radius 19.
; PLAN: r0=43(x), r1=215(y), r2=19(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 43
LDI r1, 215
LDI r2, 19
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
