; DESCRIPTION: Draws a magenta rectangle at (165, 194) with width 17 and height 39.
; PLAN: r0=165(x), r1=194(y), r2=17(width), r3=39(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 194
LDI r2, 17
LDI r3, 39
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
