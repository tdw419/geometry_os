; DESCRIPTION: Draws a black rectangle at (344, 165) with width 108 and height 79.
; PLAN: r0=344(x), r1=165(y), r2=108(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 165
LDI r2, 108
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
