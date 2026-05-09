; DESCRIPTION: Draws a magenta rectangle at (9, 154) with width 59 and height 25.
; PLAN: r0=9(x), r1=154(y), r2=59(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 154
LDI r2, 59
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
