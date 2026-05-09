; DESCRIPTION: Draws a magenta rectangle at (333, 39) with width 97 and height 79.
; PLAN: r0=333(x), r1=39(y), r2=97(width), r3=79(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 39
LDI r2, 97
LDI r3, 79
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
