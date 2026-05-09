; DESCRIPTION: Draws a black rectangle at (289, 204) with width 41 and height 51.
; PLAN: r0=289(x), r1=204(y), r2=41(width), r3=51(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 204
LDI r2, 41
LDI r3, 51
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
