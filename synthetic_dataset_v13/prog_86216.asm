; DESCRIPTION: Draws a black circle centered at (108, 215) with radius 24.
; PLAN: r0=108(x), r1=215(y), r2=24(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 108
LDI r1, 215
LDI r2, 24
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
