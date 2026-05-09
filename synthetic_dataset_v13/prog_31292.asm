; DESCRIPTION: Draws a purple rectangle at (82, 120) with width 12 and height 69.
; PLAN: r0=82(x), r1=120(y), r2=12(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 120
LDI r2, 12
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
