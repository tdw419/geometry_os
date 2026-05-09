; DESCRIPTION: Draws a magenta rectangle at (424, 22) with width 14 and height 42.
; PLAN: r0=424(x), r1=22(y), r2=14(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 22
LDI r2, 14
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
