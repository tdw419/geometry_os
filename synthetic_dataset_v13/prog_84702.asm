; DESCRIPTION: Draws a purple rectangle at (384, 118) with width 68 and height 58.
; PLAN: r0=384(x), r1=118(y), r2=68(width), r3=58(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 118
LDI r2, 68
LDI r3, 58
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
