; DESCRIPTION: Draws a magenta rectangle at (364, 225) with width 90 and height 25.
; PLAN: r0=364(x), r1=225(y), r2=90(width), r3=25(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 225
LDI r2, 90
LDI r3, 25
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
