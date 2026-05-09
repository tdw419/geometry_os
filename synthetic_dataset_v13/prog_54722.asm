; DESCRIPTION: Draws a magenta rectangle at (280, 125) with width 116 and height 12.
; PLAN: r0=280(x), r1=125(y), r2=116(width), r3=12(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 125
LDI r2, 116
LDI r3, 12
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
