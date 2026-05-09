; DESCRIPTION: Draws a orange circle centered at (441, 64) with radius 27.
; PLAN: r0=441(x), r1=64(y), r2=27(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 441
LDI r1, 64
LDI r2, 27
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
