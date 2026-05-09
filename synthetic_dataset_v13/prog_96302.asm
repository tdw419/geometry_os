; DESCRIPTION: Draws a cyan rectangle at (332, 76) with width 105 and height 119.
; PLAN: r0=332(x), r1=76(y), r2=105(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 76
LDI r2, 105
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
