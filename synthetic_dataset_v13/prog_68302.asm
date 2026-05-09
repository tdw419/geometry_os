; DESCRIPTION: Draws a red rectangle at (451, 72) with width 28 and height 118.
; PLAN: r0=451(x), r1=72(y), r2=28(width), r3=118(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 72
LDI r2, 28
LDI r3, 118
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
