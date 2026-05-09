; DESCRIPTION: Draws a magenta rectangle at (195, 117) with width 39 and height 118.
; PLAN: r0=195(x), r1=117(y), r2=39(width), r3=118(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 117
LDI r2, 39
LDI r3, 118
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
