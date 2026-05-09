; DESCRIPTION: Draws a magenta rectangle at (82, 17) with width 24 and height 116.
; PLAN: r0=82(x), r1=17(y), r2=24(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 17
LDI r2, 24
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
