; DESCRIPTION: Draws a magenta rectangle at (366, 16) with width 13 and height 109.
; PLAN: r0=366(x), r1=16(y), r2=13(width), r3=109(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 16
LDI r2, 13
LDI r3, 109
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
