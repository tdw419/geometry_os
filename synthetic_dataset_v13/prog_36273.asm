; DESCRIPTION: Draws a magenta rectangle at (462, 4) with width 50 and height 112.
; PLAN: r0=462(x), r1=4(y), r2=50(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 4
LDI r2, 50
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
