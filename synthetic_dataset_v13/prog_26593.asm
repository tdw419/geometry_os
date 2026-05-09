; DESCRIPTION: Draws a magenta rectangle at (216, 134) with width 72 and height 16.
; PLAN: r0=216(x), r1=134(y), r2=72(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 134
LDI r2, 72
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
