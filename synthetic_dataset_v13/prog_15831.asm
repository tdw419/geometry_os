; DESCRIPTION: Draws a magenta rectangle at (292, 132) with width 46 and height 12.
; PLAN: r0=292(x), r1=132(y), r2=46(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 132
LDI r2, 46
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
