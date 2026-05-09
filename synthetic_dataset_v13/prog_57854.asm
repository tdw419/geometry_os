; DESCRIPTION: Draws a orange circle centered at (356, 68) with radius 28.
; PLAN: r0=356(x), r1=68(y), r2=28(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 356
LDI r1, 68
LDI r2, 28
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
