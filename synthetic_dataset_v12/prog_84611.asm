; DESCRIPTION: Draws a red rectangle at (426, 167) with width 84 and height 85.
; PLAN: r0=426(x), r1=167(y), r2=84(width), r3=85(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 167
LDI r2, 84
LDI r3, 85
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
