; DESCRIPTION: Draws a magenta rectangle at (60, 73) with width 77 and height 35.
; PLAN: r0=60(x), r1=73(y), r2=77(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 73
LDI r2, 77
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
