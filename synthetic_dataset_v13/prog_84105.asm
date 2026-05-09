; DESCRIPTION: Draws a magenta rectangle at (132, 186) with width 112 and height 29.
; PLAN: r0=132(x), r1=186(y), r2=112(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 186
LDI r2, 112
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
