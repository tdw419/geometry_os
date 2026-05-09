; DESCRIPTION: Draws a magenta rectangle at (95, 202) with width 40 and height 38.
; PLAN: r0=95(x), r1=202(y), r2=40(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 202
LDI r2, 40
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
