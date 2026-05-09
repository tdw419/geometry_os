; DESCRIPTION: Draws a magenta rectangle at (240, 65) with width 117 and height 52.
; PLAN: r0=240(x), r1=65(y), r2=117(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 65
LDI r2, 117
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
