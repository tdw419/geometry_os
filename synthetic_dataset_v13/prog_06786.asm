; DESCRIPTION: Draws a magenta rectangle at (209, 79) with width 65 and height 61.
; PLAN: r0=209(x), r1=79(y), r2=65(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 79
LDI r2, 65
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
