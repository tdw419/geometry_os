; DESCRIPTION: Draws a orange circle centered at (442, 42) with radius 30.
; PLAN: r0=442(x), r1=42(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 442
LDI r1, 42
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
