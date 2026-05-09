; DESCRIPTION: Draws a magenta rectangle at (319, 24) with width 14 and height 35.
; PLAN: r0=319(x), r1=24(y), r2=14(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 24
LDI r2, 14
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
