; DESCRIPTION: Draws a magenta rectangle at (146, 97) with width 30 and height 23.
; PLAN: r0=146(x), r1=97(y), r2=30(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 97
LDI r2, 30
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
