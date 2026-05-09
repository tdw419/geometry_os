; DESCRIPTION: Draws a magenta rectangle at (154, 30) with width 28 and height 29.
; PLAN: r0=154(x), r1=30(y), r2=28(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 30
LDI r2, 28
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
