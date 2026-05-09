; DESCRIPTION: Draws a purple rectangle at (380, 226) with width 69 and height 25.
; PLAN: r0=380(x), r1=226(y), r2=69(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 226
LDI r2, 69
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
