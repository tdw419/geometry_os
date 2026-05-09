; DESCRIPTION: Draws a magenta rectangle at (290, 25) with width 13 and height 114.
; PLAN: r0=290(x), r1=25(y), r2=13(width), r3=114(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 25
LDI r2, 13
LDI r3, 114
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
