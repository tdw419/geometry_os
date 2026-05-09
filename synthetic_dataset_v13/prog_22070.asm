; DESCRIPTION: Draws a magenta rectangle at (353, 57) with width 41 and height 107.
; PLAN: r0=353(x), r1=57(y), r2=41(width), r3=107(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 57
LDI r2, 41
LDI r3, 107
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
