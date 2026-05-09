; DESCRIPTION: Draws a red rectangle at (107, 43) with width 26 and height 78.
; PLAN: r0=107(x), r1=43(y), r2=26(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 43
LDI r2, 26
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
