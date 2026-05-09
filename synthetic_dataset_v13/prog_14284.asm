; DESCRIPTION: Draws a magenta rectangle at (231, 59) with width 110 and height 50.
; PLAN: r0=231(x), r1=59(y), r2=110(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 59
LDI r2, 110
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
