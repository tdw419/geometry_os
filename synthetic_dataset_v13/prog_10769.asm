; DESCRIPTION: Draws a black rectangle at (49, 183) with width 25 and height 50.
; PLAN: r0=49(x), r1=183(y), r2=25(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 183
LDI r2, 25
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
