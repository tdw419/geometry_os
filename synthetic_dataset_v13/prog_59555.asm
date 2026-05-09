; DESCRIPTION: Draws a purple rectangle at (143, 85) with width 82 and height 79.
; PLAN: r0=143(x), r1=85(y), r2=82(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 85
LDI r2, 82
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
