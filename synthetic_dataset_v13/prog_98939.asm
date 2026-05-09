; DESCRIPTION: Draws a green rectangle at (166, 5) with width 74 and height 19.
; PLAN: r0=166(x), r1=5(y), r2=74(width), r3=19(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 5
LDI r2, 74
LDI r3, 19
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
