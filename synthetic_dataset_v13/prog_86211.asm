; DESCRIPTION: Draws a purple rectangle at (182, 197) with width 114 and height 11.
; PLAN: r0=182(x), r1=197(y), r2=114(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 197
LDI r2, 114
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
