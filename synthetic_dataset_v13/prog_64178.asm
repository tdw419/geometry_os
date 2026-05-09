; DESCRIPTION: Draws a magenta rectangle at (209, 29) with width 44 and height 117.
; PLAN: r0=209(x), r1=29(y), r2=44(width), r3=117(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 29
LDI r2, 44
LDI r3, 117
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
