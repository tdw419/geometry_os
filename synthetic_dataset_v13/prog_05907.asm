; DESCRIPTION: Draws a magenta rectangle at (403, 43) with width 56 and height 47.
; PLAN: r0=403(x), r1=43(y), r2=56(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 43
LDI r2, 56
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
