; DESCRIPTION: Draws a orange circle centered at (197, 175) with radius 55.
; PLAN: r0=197(x), r1=175(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 197
LDI r1, 175
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
