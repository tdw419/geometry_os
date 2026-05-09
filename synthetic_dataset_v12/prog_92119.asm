; DESCRIPTION: Draws a cyan rectangle at (381, 138) with width 88 and height 75.
; PLAN: r0=381(x), r1=138(y), r2=88(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 138
LDI r2, 88
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
