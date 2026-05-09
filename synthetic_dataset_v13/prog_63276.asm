; DESCRIPTION: Draws a red rectangle at (34, 97) with width 115 and height 29.
; PLAN: r0=34(x), r1=97(y), r2=115(width), r3=29(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 97
LDI r2, 115
LDI r3, 29
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
