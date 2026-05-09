; DESCRIPTION: Draws a magenta rectangle at (202, 12) with width 29 and height 89.
; PLAN: r0=202(x), r1=12(y), r2=29(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 12
LDI r2, 29
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
