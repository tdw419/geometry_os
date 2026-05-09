; DESCRIPTION: Draws a magenta rectangle at (300, 65) with width 69 and height 24.
; PLAN: r0=300(x), r1=65(y), r2=69(width), r3=24(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 65
LDI r2, 69
LDI r3, 24
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
