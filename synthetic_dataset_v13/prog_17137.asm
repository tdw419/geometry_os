; DESCRIPTION: Draws a magenta rectangle at (13, 146) with width 15 and height 23.
; PLAN: r0=13(x), r1=146(y), r2=15(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 146
LDI r2, 15
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
