; DESCRIPTION: Draws a magenta rectangle at (127, 187) with width 102 and height 15.
; PLAN: r0=127(x), r1=187(y), r2=102(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 187
LDI r2, 102
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
