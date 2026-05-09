; DESCRIPTION: Draws a purple rectangle at (265, 176) with width 90 and height 25.
; PLAN: r0=265(x), r1=176(y), r2=90(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 176
LDI r2, 90
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
