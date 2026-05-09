; DESCRIPTION: Draws a orange circle centered at (435, 126) with radius 61.
; PLAN: r0=435(x), r1=126(y), r2=61(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 435
LDI r1, 126
LDI r2, 61
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
