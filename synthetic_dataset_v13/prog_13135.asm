; DESCRIPTION: Draws a yellow rectangle at (402, 92) with width 41 and height 69.
; PLAN: r0=402(x), r1=92(y), r2=41(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 92
LDI r2, 41
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
