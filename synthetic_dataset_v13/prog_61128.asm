; DESCRIPTION: Draws a cyan rectangle at (191, 157) with width 119 and height 35.
; PLAN: r0=191(x), r1=157(y), r2=119(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 157
LDI r2, 119
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
