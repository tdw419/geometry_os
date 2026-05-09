; DESCRIPTION: Draws a red rectangle at (183, 178) with width 83 and height 43.
; PLAN: r0=183(x), r1=178(y), r2=83(width), r3=43(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 178
LDI r2, 83
LDI r3, 43
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
