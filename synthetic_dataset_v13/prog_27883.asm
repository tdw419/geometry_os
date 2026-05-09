; DESCRIPTION: Draws a magenta rectangle at (101, 211) with width 50 and height 26.
; PLAN: r0=101(x), r1=211(y), r2=50(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 101
LDI r1, 211
LDI r2, 50
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
