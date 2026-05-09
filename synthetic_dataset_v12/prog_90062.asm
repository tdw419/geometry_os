; DESCRIPTION: Draws a magenta rectangle at (333, 72) with width 110 and height 74.
; PLAN: r0=333(x), r1=72(y), r2=110(width), r3=74(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 72
LDI r2, 110
LDI r3, 74
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
