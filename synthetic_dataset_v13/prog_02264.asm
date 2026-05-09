; DESCRIPTION: Draws a blue rectangle at (373, 177) with width 118 and height 14.
; PLAN: r0=373(x), r1=177(y), r2=118(width), r3=14(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 177
LDI r2, 118
LDI r3, 14
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
