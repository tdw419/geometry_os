; DESCRIPTION: Draws a purple rectangle at (12, 70) with width 72 and height 82.
; PLAN: r0=12(x), r1=70(y), r2=72(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 70
LDI r2, 72
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
