; DESCRIPTION: Draws a orange circle centered at (215, 134) with radius 64.
; PLAN: r0=215(x), r1=134(y), r2=64(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 134
LDI r2, 64
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
