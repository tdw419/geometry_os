; DESCRIPTION: Draws a yellow circle centered at (166, 171) with radius 70.
; PLAN: r0=166(x), r1=171(y), r2=70(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 166
LDI r1, 171
LDI r2, 70
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
