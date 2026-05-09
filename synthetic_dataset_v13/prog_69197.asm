; DESCRIPTION: Draws a magenta rectangle at (358, 151) with width 45 and height 59.
; PLAN: r0=358(x), r1=151(y), r2=45(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 151
LDI r2, 45
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
