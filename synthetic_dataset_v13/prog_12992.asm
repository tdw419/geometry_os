; DESCRIPTION: Draws a magenta rectangle at (238, 143) with width 40 and height 97.
; PLAN: r0=238(x), r1=143(y), r2=40(width), r3=97(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 143
LDI r2, 40
LDI r3, 97
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
