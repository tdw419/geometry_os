; DESCRIPTION: Draws a red rectangle at (97, 25) with width 74 and height 26.
; PLAN: r0=97(x), r1=25(y), r2=74(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 25
LDI r2, 74
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
