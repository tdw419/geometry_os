; DESCRIPTION: Draws a yellow rectangle at (41, 49) with width 32 and height 113.
; PLAN: r0=41(x), r1=49(y), r2=32(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 49
LDI r2, 32
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
