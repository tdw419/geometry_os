; DESCRIPTION: Draws a cyan rectangle at (5, 118) with width 76 and height 88.
; PLAN: r0=5(x), r1=118(y), r2=76(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 118
LDI r2, 76
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
