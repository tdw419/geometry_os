; DESCRIPTION: Draws a magenta rectangle at (296, 68) with width 48 and height 85.
; PLAN: r0=296(x), r1=68(y), r2=48(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 68
LDI r2, 48
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
