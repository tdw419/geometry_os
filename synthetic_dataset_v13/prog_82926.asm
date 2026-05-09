; DESCRIPTION: Draws a magenta rectangle at (437, 104) with width 35 and height 13.
; PLAN: r0=437(x), r1=104(y), r2=35(width), r3=13(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 104
LDI r2, 35
LDI r3, 13
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
