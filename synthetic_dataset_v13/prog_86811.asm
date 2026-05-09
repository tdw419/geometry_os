; DESCRIPTION: Draws a magenta rectangle at (112, 144) with width 30 and height 14.
; PLAN: r0=112(x), r1=144(y), r2=30(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 144
LDI r2, 30
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
