; DESCRIPTION: Draws a orange circle centered at (250, 42) with radius 39.
; PLAN: r0=250(x), r1=42(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 250
LDI r1, 42
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
