; DESCRIPTION: Draws a cyan rectangle at (265, 175) with width 119 and height 31.
; PLAN: r0=265(x), r1=175(y), r2=119(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 175
LDI r2, 119
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
