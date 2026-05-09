; DESCRIPTION: Draws a orange circle centered at (130, 138) with radius 17.
; PLAN: r0=130(x), r1=138(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 138
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
