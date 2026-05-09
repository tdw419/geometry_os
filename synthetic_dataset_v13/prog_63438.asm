; DESCRIPTION: Draws a cyan rectangle at (130, 105) with width 70 and height 88.
; PLAN: r0=130(x), r1=105(y), r2=70(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 105
LDI r2, 70
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
