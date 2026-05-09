; DESCRIPTION: Draws a black circle centered at (215, 107) with radius 45.
; PLAN: r0=215(x), r1=107(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 107
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
