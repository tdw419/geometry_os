; DESCRIPTION: Draws a yellow rectangle at (288, 86) with width 88 and height 41.
; PLAN: r0=288(x), r1=86(y), r2=88(width), r3=41(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 86
LDI r2, 88
LDI r3, 41
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
