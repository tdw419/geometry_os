; DESCRIPTION: Draws a black circle centered at (215, 125) with radius 71.
; PLAN: r0=215(x), r1=125(y), r2=71(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 125
LDI r2, 71
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
