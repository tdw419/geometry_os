; DESCRIPTION: Draws a orange circle centered at (279, 224) with radius 32.
; PLAN: r0=279(x), r1=224(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 279
LDI r1, 224
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
