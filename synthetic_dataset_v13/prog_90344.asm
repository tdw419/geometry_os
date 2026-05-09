; DESCRIPTION: Draws a magenta rectangle at (19, 59) with width 31 and height 98.
; PLAN: r0=19(x), r1=59(y), r2=31(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 59
LDI r2, 31
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
