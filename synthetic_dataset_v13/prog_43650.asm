; DESCRIPTION: Draws a magenta rectangle at (79, 222) with width 115 and height 18.
; PLAN: r0=79(x), r1=222(y), r2=115(width), r3=18(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 222
LDI r2, 115
LDI r3, 18
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
