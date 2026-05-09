; DESCRIPTION: Draws a magenta rectangle at (57, 1) with width 46 and height 74.
; PLAN: r0=57(x), r1=1(y), r2=46(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 1
LDI r2, 46
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
