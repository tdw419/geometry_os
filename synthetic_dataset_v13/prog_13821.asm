; DESCRIPTION: Draws a black rectangle at (74, 75) with width 12 and height 37.
; PLAN: r0=74(x), r1=75(y), r2=12(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 75
LDI r2, 12
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
