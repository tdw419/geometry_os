; DESCRIPTION: Draws a cyan rectangle at (316, 105) with width 98 and height 29.
; PLAN: r0=316(x), r1=105(y), r2=98(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 105
LDI r2, 98
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
