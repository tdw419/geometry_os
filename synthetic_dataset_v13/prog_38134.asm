; DESCRIPTION: Draws a magenta rectangle at (366, 3) with width 117 and height 61.
; PLAN: r0=366(x), r1=3(y), r2=117(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 3
LDI r2, 117
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
