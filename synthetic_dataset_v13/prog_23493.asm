; DESCRIPTION: Draws a yellow circle centered at (202, 61) with radius 41.
; PLAN: r0=202(x), r1=61(y), r2=41(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 61
LDI r2, 41
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
