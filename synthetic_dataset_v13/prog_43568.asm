; DESCRIPTION: Draws a magenta rectangle at (7, 34) with width 100 and height 46.
; PLAN: r0=7(x), r1=34(y), r2=100(width), r3=46(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 34
LDI r2, 100
LDI r3, 46
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
