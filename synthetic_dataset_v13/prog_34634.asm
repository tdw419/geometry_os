; DESCRIPTION: Draws a magenta rectangle at (342, 86) with width 36 and height 110.
; PLAN: r0=342(x), r1=86(y), r2=36(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 86
LDI r2, 36
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
