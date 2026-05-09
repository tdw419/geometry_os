; DESCRIPTION: Draws a green rectangle at (95, 121) with width 102 and height 97.
; PLAN: r0=95(x), r1=121(y), r2=102(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 121
LDI r2, 102
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
