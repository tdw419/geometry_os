; DESCRIPTION: Draws a magenta rectangle at (318, 46) with width 22 and height 103.
; PLAN: r0=318(x), r1=46(y), r2=22(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 46
LDI r2, 22
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
