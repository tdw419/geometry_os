; DESCRIPTION: Draws a purple rectangle at (191, 24) with width 57 and height 79.
; PLAN: r0=191(x), r1=24(y), r2=57(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 24
LDI r2, 57
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
