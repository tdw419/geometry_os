; DESCRIPTION: Draws a magenta rectangle at (166, 116) with width 47 and height 59.
; PLAN: r0=166(x), r1=116(y), r2=47(width), r3=59(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 116
LDI r2, 47
LDI r3, 59
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
