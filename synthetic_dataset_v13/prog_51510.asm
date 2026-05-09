; DESCRIPTION: Draws a red rectangle at (432, 62) with width 77 and height 97.
; PLAN: r0=432(x), r1=62(y), r2=77(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 62
LDI r2, 77
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
