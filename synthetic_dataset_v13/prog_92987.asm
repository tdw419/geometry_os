; DESCRIPTION: Draws a purple rectangle at (156, 98) with width 25 and height 68.
; PLAN: r0=156(x), r1=98(y), r2=25(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 98
LDI r2, 25
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
