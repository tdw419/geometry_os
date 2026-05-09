; DESCRIPTION: Draws a purple rectangle at (462, 134) with width 11 and height 87.
; PLAN: r0=462(x), r1=134(y), r2=11(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 134
LDI r2, 11
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
