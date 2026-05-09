; DESCRIPTION: Draws a magenta rectangle at (39, 22) with width 73 and height 57.
; PLAN: r0=39(x), r1=22(y), r2=73(width), r3=57(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 22
LDI r2, 73
LDI r3, 57
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
