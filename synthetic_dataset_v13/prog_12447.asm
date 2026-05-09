; DESCRIPTION: Draws a magenta rectangle at (172, 39) with width 87 and height 108.
; PLAN: r0=172(x), r1=39(y), r2=87(width), r3=108(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 39
LDI r2, 87
LDI r3, 108
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
