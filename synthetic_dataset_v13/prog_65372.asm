; DESCRIPTION: Draws a magenta rectangle at (300, 203) with width 18 and height 26.
; PLAN: r0=300(x), r1=203(y), r2=18(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 203
LDI r2, 18
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
