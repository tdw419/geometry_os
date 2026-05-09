; DESCRIPTION: Draws a magenta rectangle at (230, 46) with width 63 and height 17.
; PLAN: r0=230(x), r1=46(y), r2=63(width), r3=17(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 46
LDI r2, 63
LDI r3, 17
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
