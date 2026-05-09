; DESCRIPTION: Draws a red rectangle at (158, 53) with width 43 and height 71.
; PLAN: r0=158(x), r1=53(y), r2=43(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 53
LDI r2, 43
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
