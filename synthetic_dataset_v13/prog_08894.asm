; DESCRIPTION: Draws a magenta rectangle at (91, 18) with width 50 and height 62.
; PLAN: r0=91(x), r1=18(y), r2=50(width), r3=62(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 18
LDI r2, 50
LDI r3, 62
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
