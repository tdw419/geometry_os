; DESCRIPTION: Draws a magenta rectangle at (383, 15) with width 109 and height 46.
; PLAN: r0=383(x), r1=15(y), r2=109(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 15
LDI r2, 109
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
