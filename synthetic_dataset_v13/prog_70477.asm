; DESCRIPTION: Draws a magenta rectangle at (393, 73) with width 114 and height 99.
; PLAN: r0=393(x), r1=73(y), r2=114(width), r3=99(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 73
LDI r2, 114
LDI r3, 99
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
