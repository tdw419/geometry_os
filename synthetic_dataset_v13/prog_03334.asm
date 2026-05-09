; DESCRIPTION: Draws a red rectangle at (286, 70) with width 15 and height 62.
; PLAN: r0=286(x), r1=70(y), r2=15(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 70
LDI r2, 15
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
