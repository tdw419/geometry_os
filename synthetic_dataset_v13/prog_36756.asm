; DESCRIPTION: Draws a magenta rectangle at (309, 90) with width 82 and height 58.
; PLAN: r0=309(x), r1=90(y), r2=82(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 90
LDI r2, 82
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
