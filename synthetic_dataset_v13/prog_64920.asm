; DESCRIPTION: Draws a magenta rectangle at (205, 29) with width 21 and height 22.
; PLAN: r0=205(x), r1=29(y), r2=21(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 29
LDI r2, 21
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
