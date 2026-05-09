; DESCRIPTION: Draws a purple rectangle at (166, 159) with width 10 and height 81.
; PLAN: r0=166(x), r1=159(y), r2=10(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 159
LDI r2, 10
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
