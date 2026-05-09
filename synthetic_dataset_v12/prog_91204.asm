; DESCRIPTION: Draws a red rectangle at (50, 158) with width 84 and height 76.
; PLAN: r0=50(x), r1=158(y), r2=84(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 158
LDI r2, 84
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
