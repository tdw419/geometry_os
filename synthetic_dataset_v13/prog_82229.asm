; DESCRIPTION: Draws a orange circle centered at (385, 98) with radius 80.
; PLAN: r0=385(x), r1=98(y), r2=80(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 385
LDI r1, 98
LDI r2, 80
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
