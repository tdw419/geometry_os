; DESCRIPTION: Draws a magenta rectangle at (21, 49) with width 66 and height 68.
; PLAN: r0=21(x), r1=49(y), r2=66(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 49
LDI r2, 66
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
