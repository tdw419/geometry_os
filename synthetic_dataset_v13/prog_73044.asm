; DESCRIPTION: Draws a magenta rectangle at (323, 41) with width 83 and height 96.
; PLAN: r0=323(x), r1=41(y), r2=83(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 41
LDI r2, 83
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
