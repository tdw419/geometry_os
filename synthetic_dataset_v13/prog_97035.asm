; DESCRIPTION: Draws a magenta rectangle at (230, 39) with width 94 and height 105.
; PLAN: r0=230(x), r1=39(y), r2=94(width), r3=105(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 39
LDI r2, 94
LDI r3, 105
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
