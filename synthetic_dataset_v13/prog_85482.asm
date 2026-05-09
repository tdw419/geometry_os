; DESCRIPTION: Draws a cyan rectangle at (318, 105) with width 80 and height 69.
; PLAN: r0=318(x), r1=105(y), r2=80(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 105
LDI r2, 80
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
