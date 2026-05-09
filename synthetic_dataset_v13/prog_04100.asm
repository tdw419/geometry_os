; DESCRIPTION: Draws a magenta rectangle at (330, 116) with width 94 and height 101.
; PLAN: r0=330(x), r1=116(y), r2=94(width), r3=101(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 116
LDI r2, 94
LDI r3, 101
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
