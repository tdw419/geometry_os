; DESCRIPTION: Draws a green rectangle at (249, 25) with width 15 and height 39.
; PLAN: r0=249(x), r1=25(y), r2=15(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 25
LDI r2, 15
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
