; DESCRIPTION: Draws a magenta rectangle at (208, 166) with width 33 and height 26.
; PLAN: r0=208(x), r1=166(y), r2=33(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 166
LDI r2, 33
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
