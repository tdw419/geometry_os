; DESCRIPTION: Draws a orange circle centered at (350, 190) with radius 59.
; PLAN: r0=350(x), r1=190(y), r2=59(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 350
LDI r1, 190
LDI r2, 59
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
