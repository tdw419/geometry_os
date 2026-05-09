; DESCRIPTION: Draws a magenta rectangle at (175, 177) with width 99 and height 28.
; PLAN: r0=175(x), r1=177(y), r2=99(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 177
LDI r2, 99
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
