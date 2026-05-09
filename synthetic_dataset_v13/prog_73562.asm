; DESCRIPTION: Draws a red rectangle at (47, 50) with width 102 and height 43.
; PLAN: r0=47(x), r1=50(y), r2=102(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 50
LDI r2, 102
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
