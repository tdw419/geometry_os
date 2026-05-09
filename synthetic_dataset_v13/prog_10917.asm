; DESCRIPTION: Draws a orange circle centered at (416, 160) with radius 42.
; PLAN: r0=416(x), r1=160(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 160
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
