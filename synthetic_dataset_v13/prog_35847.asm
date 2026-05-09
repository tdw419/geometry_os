; DESCRIPTION: Draws a red rectangle at (37, 118) with width 105 and height 47.
; PLAN: r0=37(x), r1=118(y), r2=105(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 118
LDI r2, 105
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
