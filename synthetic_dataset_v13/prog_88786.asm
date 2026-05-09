; DESCRIPTION: Draws a magenta rectangle at (34, 28) with width 84 and height 95.
; PLAN: r0=34(x), r1=28(y), r2=84(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 28
LDI r2, 84
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
