; DESCRIPTION: Draws a purple rectangle at (41, 82) with width 79 and height 81.
; PLAN: r0=41(x), r1=82(y), r2=79(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 82
LDI r2, 79
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
