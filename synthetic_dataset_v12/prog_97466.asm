; DESCRIPTION: Draws a yellow rectangle at (380, 177) with width 10 and height 41.
; PLAN: r0=380(x), r1=177(y), r2=10(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 177
LDI r2, 10
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
