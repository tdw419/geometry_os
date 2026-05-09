; DESCRIPTION: Draws a magenta rectangle at (373, 133) with width 17 and height 98.
; PLAN: r0=373(x), r1=133(y), r2=17(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 133
LDI r2, 17
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
