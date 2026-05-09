; DESCRIPTION: Draws a green rectangle at (344, 2) with width 112 and height 71.
; PLAN: r0=344(x), r1=2(y), r2=112(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 2
LDI r2, 112
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
