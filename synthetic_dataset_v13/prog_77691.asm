; DESCRIPTION: Draws a white rectangle at (390, 146) with width 47 and height 101.
; PLAN: r0=390(x), r1=146(y), r2=47(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 390
LDI r1, 146
LDI r2, 47
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
