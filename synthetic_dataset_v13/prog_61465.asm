; DESCRIPTION: Draws a magenta rectangle at (344, 178) with width 45 and height 59.
; PLAN: r0=344(x), r1=178(y), r2=45(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 178
LDI r2, 45
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
