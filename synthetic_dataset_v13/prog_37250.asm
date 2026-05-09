; DESCRIPTION: Draws a purple rectangle at (292, 156) with width 113 and height 55.
; PLAN: r0=292(x), r1=156(y), r2=113(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 156
LDI r2, 113
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
