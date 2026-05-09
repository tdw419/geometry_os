; DESCRIPTION: Draws a magenta rectangle at (42, 84) with width 16 and height 69.
; PLAN: r0=42(x), r1=84(y), r2=16(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 84
LDI r2, 16
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
