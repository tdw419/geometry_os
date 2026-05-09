; DESCRIPTION: Draws a magenta rectangle at (35, 126) with width 12 and height 41.
; PLAN: r0=35(x), r1=126(y), r2=12(width), r3=41(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 126
LDI r2, 12
LDI r3, 41
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
