; DESCRIPTION: Draws a magenta rectangle at (203, 138) with width 104 and height 10.
; PLAN: r0=203(x), r1=138(y), r2=104(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 138
LDI r2, 104
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
