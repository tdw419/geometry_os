; DESCRIPTION: Draws a magenta rectangle at (236, 57) with width 82 and height 78.
; PLAN: r0=236(x), r1=57(y), r2=82(width), r3=78(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 57
LDI r2, 82
LDI r3, 78
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
