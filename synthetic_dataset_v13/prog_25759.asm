; DESCRIPTION: Draws a magenta rectangle at (41, 5) with width 116 and height 50.
; PLAN: r0=41(x), r1=5(y), r2=116(width), r3=50(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 5
LDI r2, 116
LDI r3, 50
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
