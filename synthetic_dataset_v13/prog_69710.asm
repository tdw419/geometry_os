; DESCRIPTION: Draws a magenta rectangle at (314, 186) with width 69 and height 37.
; PLAN: r0=314(x), r1=186(y), r2=69(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 314
LDI r1, 186
LDI r2, 69
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
