; DESCRIPTION: Draws a yellow circle centered at (193, 41) with radius 40.
; PLAN: r0=193(x), r1=41(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 193
LDI r1, 41
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
