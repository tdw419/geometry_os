; DESCRIPTION: Draws a magenta rectangle at (178, 4) with width 12 and height 108.
; PLAN: r0=178(x), r1=4(y), r2=12(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 4
LDI r2, 12
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
