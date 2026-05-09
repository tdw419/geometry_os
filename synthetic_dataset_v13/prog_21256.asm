; DESCRIPTION: Draws a black rectangle at (301, 198) with width 113 and height 49.
; PLAN: r0=301(x), r1=198(y), r2=113(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 198
LDI r2, 113
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
