; DESCRIPTION: Draws a purple rectangle at (273, 195) with width 109 and height 29.
; PLAN: r0=273(x), r1=195(y), r2=109(width), r3=29(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 195
LDI r2, 109
LDI r3, 29
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
