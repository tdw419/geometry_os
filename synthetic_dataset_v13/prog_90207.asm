; DESCRIPTION: Draws a magenta rectangle at (109, 98) with width 113 and height 58.
; PLAN: r0=109(x), r1=98(y), r2=113(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 98
LDI r2, 113
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
