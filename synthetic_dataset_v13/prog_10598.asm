; DESCRIPTION: Draws a black rectangle at (344, 24) with width 100 and height 71.
; PLAN: r0=344(x), r1=24(y), r2=100(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 24
LDI r2, 100
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
