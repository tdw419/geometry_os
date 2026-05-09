; DESCRIPTION: Draws a orange circle centered at (113, 215) with radius 40.
; PLAN: r0=113(x), r1=215(y), r2=40(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 113
LDI r1, 215
LDI r2, 40
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
