; DESCRIPTION: Draws a green rectangle at (246, 94) with width 40 and height 105.
; PLAN: r0=246(x), r1=94(y), r2=40(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 94
LDI r2, 40
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
