; DESCRIPTION: Draws a black rectangle at (212, 29) with width 113 and height 97.
; PLAN: r0=212(x), r1=29(y), r2=113(width), r3=97(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 29
LDI r2, 113
LDI r3, 97
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
