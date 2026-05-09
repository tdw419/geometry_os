; DESCRIPTION: Draws a cyan rectangle at (17, 48) with width 119 and height 105.
; PLAN: r0=17(x), r1=48(y), r2=119(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 48
LDI r2, 119
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
