; DESCRIPTION: Draws a purple rectangle at (273, 75) with width 113 and height 65.
; PLAN: r0=273(x), r1=75(y), r2=113(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 75
LDI r2, 113
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
