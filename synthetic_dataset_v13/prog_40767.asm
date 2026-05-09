; DESCRIPTION: Draws a magenta rectangle at (350, 174) with width 95 and height 47.
; PLAN: r0=350(x), r1=174(y), r2=95(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 174
LDI r2, 95
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
