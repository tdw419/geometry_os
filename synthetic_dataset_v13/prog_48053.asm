; DESCRIPTION: Draws a magenta rectangle at (182, 157) with width 95 and height 58.
; PLAN: r0=182(x), r1=157(y), r2=95(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 157
LDI r2, 95
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
