; DESCRIPTION: Draws a green rectangle at (74, 4) with width 49 and height 68.
; PLAN: r0=74(x), r1=4(y), r2=49(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 4
LDI r2, 49
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
