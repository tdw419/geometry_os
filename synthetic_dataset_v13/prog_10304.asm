; DESCRIPTION: Draws a blue rectangle at (79, 156) with width 16 and height 26.
; PLAN: r0=79(x), r1=156(y), r2=16(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 156
LDI r2, 16
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
