; DESCRIPTION: Draws a orange circle centered at (307, 163) with radius 41.
; PLAN: r0=307(x), r1=163(y), r2=41(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 307
LDI r1, 163
LDI r2, 41
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
