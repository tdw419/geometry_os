; DESCRIPTION: Draws a blue rectangle at (149, 91) with width 41 and height 67.
; PLAN: r0=149(x), r1=91(y), r2=41(width), r3=67(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 91
LDI r2, 41
LDI r3, 67
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
