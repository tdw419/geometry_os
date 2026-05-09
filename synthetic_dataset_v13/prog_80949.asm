; DESCRIPTION: Draws a magenta rectangle at (113, 22) with width 44 and height 82.
; PLAN: r0=113(x), r1=22(y), r2=44(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 22
LDI r2, 44
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
