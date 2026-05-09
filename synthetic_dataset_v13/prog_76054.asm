; DESCRIPTION: Draws a orange circle centered at (387, 49) with radius 39.
; PLAN: r0=387(x), r1=49(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 387
LDI r1, 49
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
