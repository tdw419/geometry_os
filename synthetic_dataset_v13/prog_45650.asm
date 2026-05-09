; DESCRIPTION: Draws a magenta rectangle at (252, 121) with width 58 and height 115.
; PLAN: r0=252(x), r1=121(y), r2=58(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 121
LDI r2, 58
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
