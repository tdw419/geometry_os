; DESCRIPTION: Draws a blue rectangle at (177, 0) with width 97 and height 118.
; PLAN: r0=177(x), r1=0(y), r2=97(width), r3=118(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 0
LDI r2, 97
LDI r3, 118
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
