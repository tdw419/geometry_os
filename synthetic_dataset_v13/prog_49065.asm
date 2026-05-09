; DESCRIPTION: Draws a magenta rectangle at (183, 159) with width 14 and height 12.
; PLAN: r0=183(x), r1=159(y), r2=14(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 159
LDI r2, 14
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
