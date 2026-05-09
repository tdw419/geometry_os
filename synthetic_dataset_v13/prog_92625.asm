; DESCRIPTION: Draws a cyan rectangle at (430, 106) with width 17 and height 119.
; PLAN: r0=430(x), r1=106(y), r2=17(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 106
LDI r2, 17
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
