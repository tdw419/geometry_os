; DESCRIPTION: Draws a orange circle centered at (128, 177) with radius 77.
; PLAN: r0=128(x), r1=177(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 128
LDI r1, 177
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
