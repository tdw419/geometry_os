; DESCRIPTION: Draws a magenta rectangle at (296, 168) with width 90 and height 30.
; PLAN: r0=296(x), r1=168(y), r2=90(width), r3=30(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 168
LDI r2, 90
LDI r3, 30
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
