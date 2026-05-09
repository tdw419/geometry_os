; DESCRIPTION: Draws a orange circle centered at (294, 153) with radius 12.
; PLAN: r0=294(x), r1=153(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 153
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
