; DESCRIPTION: Draws a magenta rectangle at (436, 39) with width 43 and height 48.
; PLAN: r0=436(x), r1=39(y), r2=43(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 39
LDI r2, 43
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
