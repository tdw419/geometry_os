; DESCRIPTION: Draws a purple rectangle at (8, 82) with width 113 and height 69.
; PLAN: r0=8(x), r1=82(y), r2=113(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 82
LDI r2, 113
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
