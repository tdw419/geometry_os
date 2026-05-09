; DESCRIPTION: Draws a magenta rectangle at (405, 62) with width 26 and height 50.
; PLAN: r0=405(x), r1=62(y), r2=26(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 62
LDI r2, 26
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
