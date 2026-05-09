; DESCRIPTION: Draws a magenta rectangle at (296, 137) with width 117 and height 68.
; PLAN: r0=296(x), r1=137(y), r2=117(width), r3=68(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 137
LDI r2, 117
LDI r3, 68
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
