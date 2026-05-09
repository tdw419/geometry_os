; DESCRIPTION: Draws a magenta rectangle at (86, 44) with width 22 and height 61.
; PLAN: r0=86(x), r1=44(y), r2=22(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 44
LDI r2, 22
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
