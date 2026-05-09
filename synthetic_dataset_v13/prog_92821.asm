; DESCRIPTION: Draws a orange circle centered at (275, 209) with radius 31.
; PLAN: r0=275(x), r1=209(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 275
LDI r1, 209
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
