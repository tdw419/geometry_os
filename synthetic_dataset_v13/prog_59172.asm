; DESCRIPTION: Draws a yellow circle centered at (164, 79) with radius 38.
; PLAN: r0=164(x), r1=79(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 164
LDI r1, 79
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
