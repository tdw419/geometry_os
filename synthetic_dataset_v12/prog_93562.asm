; DESCRIPTION: Draws a magenta rectangle at (349, 167) with width 39 and height 77.
; PLAN: r0=349(x), r1=167(y), r2=39(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 167
LDI r2, 39
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
