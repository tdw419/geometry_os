; DESCRIPTION: Draws a magenta rectangle at (218, 116) with width 79 and height 88.
; PLAN: r0=218(x), r1=116(y), r2=79(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 116
LDI r2, 79
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
