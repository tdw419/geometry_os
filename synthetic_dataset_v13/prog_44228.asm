; DESCRIPTION: Draws a magenta rectangle at (126, 29) with width 88 and height 21.
; PLAN: r0=126(x), r1=29(y), r2=88(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 29
LDI r2, 88
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
