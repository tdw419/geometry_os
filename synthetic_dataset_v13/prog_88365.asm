; DESCRIPTION: Draws a magenta rectangle at (41, 28) with width 28 and height 98.
; PLAN: r0=41(x), r1=28(y), r2=28(width), r3=98(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 28
LDI r2, 28
LDI r3, 98
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
