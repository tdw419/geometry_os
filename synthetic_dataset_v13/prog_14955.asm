; DESCRIPTION: Draws a orange circle centered at (434, 98) with radius 59.
; PLAN: r0=434(x), r1=98(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 434
LDI r1, 98
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
