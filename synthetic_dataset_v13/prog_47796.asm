; DESCRIPTION: Draws a magenta rectangle at (267, 75) with width 47 and height 70.
; PLAN: r0=267(x), r1=75(y), r2=47(width), r3=70(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 75
LDI r2, 47
LDI r3, 70
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
