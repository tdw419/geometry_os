; DESCRIPTION: Draws a orange circle centered at (224, 125) with radius 59.
; PLAN: r0=224(x), r1=125(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 224
LDI r1, 125
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
