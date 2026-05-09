; DESCRIPTION: Draws a magenta rectangle at (246, 135) with width 16 and height 116.
; PLAN: r0=246(x), r1=135(y), r2=16(width), r3=116(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 135
LDI r2, 16
LDI r3, 116
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
