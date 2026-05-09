; DESCRIPTION: Draws a purple rectangle at (276, 121) with width 99 and height 113.
; PLAN: r0=276(x), r1=121(y), r2=99(width), r3=113(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 121
LDI r2, 99
LDI r3, 113
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
