; DESCRIPTION: Draws a yellow circle centered at (362, 41) with radius 31.
; PLAN: r0=362(x), r1=41(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 362
LDI r1, 41
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
