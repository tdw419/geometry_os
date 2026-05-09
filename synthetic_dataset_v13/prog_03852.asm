; DESCRIPTION: Draws a purple rectangle at (151, 98) with width 102 and height 68.
; PLAN: r0=151(x), r1=98(y), r2=102(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 98
LDI r2, 102
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
