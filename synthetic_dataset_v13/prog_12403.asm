; DESCRIPTION: Draws a magenta rectangle at (340, 5) with width 26 and height 73.
; PLAN: r0=340(x), r1=5(y), r2=26(width), r3=73(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 5
LDI r2, 26
LDI r3, 73
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
