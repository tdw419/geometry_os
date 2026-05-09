; DESCRIPTION: Draws a magenta rectangle at (344, 39) with width 117 and height 80.
; PLAN: r0=344(x), r1=39(y), r2=117(width), r3=80(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 39
LDI r2, 117
LDI r3, 80
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
