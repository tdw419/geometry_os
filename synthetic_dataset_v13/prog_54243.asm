; DESCRIPTION: Draws a magenta rectangle at (27, 210) with width 113 and height 38.
; PLAN: r0=27(x), r1=210(y), r2=113(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 210
LDI r2, 113
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
