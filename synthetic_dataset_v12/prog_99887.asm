; DESCRIPTION: Draws a magenta rectangle at (330, 71) with width 108 and height 81.
; PLAN: r0=330(x), r1=71(y), r2=108(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 71
LDI r2, 108
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
