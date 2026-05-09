; DESCRIPTION: Draws a magenta rectangle at (441, 133) with width 57 and height 71.
; PLAN: r0=441(x), r1=133(y), r2=57(width), r3=71(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 441
LDI r1, 133
LDI r2, 57
LDI r3, 71
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
