; DESCRIPTION: Draws a red rectangle at (279, 78) with width 43 and height 26.
; PLAN: r0=279(x), r1=78(y), r2=43(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 78
LDI r2, 43
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
