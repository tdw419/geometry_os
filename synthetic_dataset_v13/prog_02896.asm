; DESCRIPTION: Draws a magenta rectangle at (301, 37) with width 46 and height 59.
; PLAN: r0=301(x), r1=37(y), r2=46(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 37
LDI r2, 46
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
