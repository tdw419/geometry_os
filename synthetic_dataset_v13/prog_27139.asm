; DESCRIPTION: Draws a orange circle centered at (314, 195) with radius 42.
; PLAN: r0=314(x), r1=195(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 314
LDI r1, 195
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
