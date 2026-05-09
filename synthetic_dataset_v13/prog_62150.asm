; DESCRIPTION: Draws a black circle centered at (430, 138) with radius 70.
; PLAN: r0=430(x), r1=138(y), r2=70(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 430
LDI r1, 138
LDI r2, 70
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
HALT
