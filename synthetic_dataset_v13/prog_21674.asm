; DESCRIPTION: Draws a orange circle centered at (107, 47) with radius 17.
; PLAN: r0=107(x), r1=47(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 107
LDI r1, 47
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
