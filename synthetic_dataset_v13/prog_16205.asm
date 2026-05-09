; DESCRIPTION: Draws a green rectangle at (249, 159) with width 88 and height 45.
; PLAN: r0=249(x), r1=159(y), r2=88(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 159
LDI r2, 88
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
