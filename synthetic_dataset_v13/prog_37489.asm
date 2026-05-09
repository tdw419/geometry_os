; DESCRIPTION: Draws a magenta rectangle at (79, 31) with width 23 and height 26.
; PLAN: r0=79(x), r1=31(y), r2=23(width), r3=26(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 31
LDI r2, 23
LDI r3, 26
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
