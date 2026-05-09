; DESCRIPTION: Draws a cyan rectangle at (125, 155) with width 102 and height 88.
; PLAN: r0=125(x), r1=155(y), r2=102(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 155
LDI r2, 102
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
