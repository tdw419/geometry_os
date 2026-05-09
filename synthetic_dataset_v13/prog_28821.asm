; DESCRIPTION: Draws a magenta rectangle at (129, 39) with width 22 and height 104.
; PLAN: r0=129(x), r1=39(y), r2=22(width), r3=104(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 39
LDI r2, 22
LDI r3, 104
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
