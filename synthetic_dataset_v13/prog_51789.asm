; DESCRIPTION: Draws a black rectangle at (344, 166) with width 82 and height 69.
; PLAN: r0=344(x), r1=166(y), r2=82(width), r3=69(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 166
LDI r2, 82
LDI r3, 69
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
