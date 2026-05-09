; DESCRIPTION: Draws a magenta rectangle at (30, 69) with width 12 and height 77.
; PLAN: r0=30(x), r1=69(y), r2=12(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 69
LDI r2, 12
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
