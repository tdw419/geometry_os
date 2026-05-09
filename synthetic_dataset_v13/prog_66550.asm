; DESCRIPTION: Draws a magenta rectangle at (368, 135) with width 60 and height 49.
; PLAN: r0=368(x), r1=135(y), r2=60(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 135
LDI r2, 60
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
