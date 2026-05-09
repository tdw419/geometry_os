; DESCRIPTION: Draws a blue circle centered at (215, 82) with radius 29.
; PLAN: r0=215(x), r1=82(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 82
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
