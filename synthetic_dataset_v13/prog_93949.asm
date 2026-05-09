; DESCRIPTION: Draws a red rectangle at (378, 84) with width 99 and height 97.
; PLAN: r0=378(x), r1=84(y), r2=99(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 84
LDI r2, 99
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
