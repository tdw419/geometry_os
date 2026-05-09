; DESCRIPTION: Draws a magenta rectangle at (264, 148) with width 113 and height 98.
; PLAN: r0=264(x), r1=148(y), r2=113(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 148
LDI r2, 113
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
