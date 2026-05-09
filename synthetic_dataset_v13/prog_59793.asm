; DESCRIPTION: Draws a red rectangle at (95, 72) with width 34 and height 97.
; PLAN: r0=95(x), r1=72(y), r2=34(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 72
LDI r2, 34
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
