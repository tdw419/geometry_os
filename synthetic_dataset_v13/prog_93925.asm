; DESCRIPTION: Draws a magenta rectangle at (187, 127) with width 109 and height 69.
; PLAN: r0=187(x), r1=127(y), r2=109(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 127
LDI r2, 109
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
