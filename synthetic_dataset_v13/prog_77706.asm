; DESCRIPTION: Draws a red rectangle at (162, 159) with width 62 and height 74.
; PLAN: r0=162(x), r1=159(y), r2=62(width), r3=74(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 159
LDI r2, 62
LDI r3, 74
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
