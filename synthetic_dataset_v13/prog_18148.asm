; DESCRIPTION: Draws a magenta rectangle at (279, 82) with width 108 and height 68.
; PLAN: r0=279(x), r1=82(y), r2=108(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 82
LDI r2, 108
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
