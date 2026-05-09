; DESCRIPTION: Draws a magenta rectangle at (113, 27) with width 13 and height 55.
; PLAN: r0=113(x), r1=27(y), r2=13(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 27
LDI r2, 13
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
