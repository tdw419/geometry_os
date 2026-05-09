; DESCRIPTION: Draws a purple rectangle at (82, 134) with width 84 and height 107.
; PLAN: r0=82(x), r1=134(y), r2=84(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 134
LDI r2, 84
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
