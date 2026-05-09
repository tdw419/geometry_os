; DESCRIPTION: Draws a magenta rectangle at (312, 78) with width 68 and height 104.
; PLAN: r0=312(x), r1=78(y), r2=68(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 78
LDI r2, 68
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
