; DESCRIPTION: Draws a cyan rectangle at (110, 165) with width 101 and height 88.
; PLAN: r0=110(x), r1=165(y), r2=101(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 165
LDI r2, 101
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
