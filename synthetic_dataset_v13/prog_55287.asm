; DESCRIPTION: Draws a magenta rectangle at (81, 104) with width 87 and height 59.
; PLAN: r0=81(x), r1=104(y), r2=87(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 104
LDI r2, 87
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
