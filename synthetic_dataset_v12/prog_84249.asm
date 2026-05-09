; DESCRIPTION: Draws a magenta rectangle at (38, 210) with width 115 and height 15.
; PLAN: r0=38(x), r1=210(y), r2=115(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 210
LDI r2, 115
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
