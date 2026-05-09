; DESCRIPTION: Draws a black rectangle at (162, 134) with width 39 and height 62.
; PLAN: r0=162(x), r1=134(y), r2=39(width), r3=62(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 134
LDI r2, 39
LDI r3, 62
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
